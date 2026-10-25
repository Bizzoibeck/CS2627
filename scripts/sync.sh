#!/usr/bin/env bash
# Lädt alle Materialien (PDFs, Zusatzdateien) der Kursseiten aus courses.conf herunter.
# Neue oder auf dem Server geänderte Dateien werden geholt, vorhandene übersprungen.
# Aufruf: ./scripts/sync.sh [ordner ...]   (ohne Argument: alle Module)
# Zugangsdaten (falls außerhalb des Uni-Netzes nötig) kommen aus .env:
# <ORDNER>_USER/_PASS (z. B. KIVS_USER), sonst SYSPROG_USER/_PASS als Standard.
set -uo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BASE_URL="https://net.cs.uni-bonn.de/"

# Datei-Zeitstempel (Sekunden) – macOS (BSD stat) und Linux (GNU stat)
mtime() { stat -f %m "$1" 2>/dev/null || stat -c %Y "$1"; }

# shellcheck disable=SC1091
[[ -f "$ROOT/.env" ]] && source "$ROOT/.env"

target_dir() {
  case "$1" in
    */Folien/*|*/Slides/*|*/Vorlesung/*)          echo "Folien" ;;
    */UeZettel/*|*/Uebung*/*|*/Exercise*/*)       echo "Übungszettel" ;;
    */Altklausuren/*|*/Klausur*/*)                echo "Altklausuren" ;;
    *)                                            echo "Material" ;;
  esac
}

# Entpackt in ein PDF eingebettete Dateien (Vorlagen, Tests) nach $2, mit ihrer Ordnerstruktur.
extract_attachments() {
  local pdf="$1" dest="$2" line idx name
  command -v pdfdetach >/dev/null || return 0
  while IFS= read -r line; do
    [[ "$line" =~ ^([0-9]+):\ (.+)$ ]] || continue
    idx="${BASH_REMATCH[1]}"; name="${BASH_REMATCH[2]}"
    # Keine absoluten Pfade oder ".." aus dem PDF übernehmen
    [[ "$name" == /* || "$name" == *..* ]] && name="$(basename "$name")"
    mkdir -p "$dest/$(dirname "$name")"
    pdfdetach -save "$idx" -o "$dest/$name" "$pdf" >/dev/null 2>&1 \
      && echo "  eingebettete Datei: ${dest#$ROOT/}/$name"
  done < <(pdfdetach -list "$pdf" 2>/dev/null)
}

# Legt für jedes Übungsblatt <id>/lösungen/übungszettel_NN an (NN = erste Zahl im Dateinamen)
# und entpackt eingebettete Dateien nach vorgabe/.
make_solution_dirs() {
  local id="$1" sheet num dir
  for sheet in "$ROOT/$id/Übungszettel"/*; do
    [[ -f "$sheet" ]] || continue
    num="$(basename "$sheet" | grep -oE '[0-9]+' | head -1)"
    [[ -n "$num" ]] || continue
    dir="$ROOT/$id/lösungen/übungszettel_$(printf '%02d' "$((10#$num))")"
    [[ -d "$dir" ]] && continue
    mkdir -p "$dir"
    printf '# Übungszettel %02d\n\nAufgabenblatt: [%s](../../Übungszettel/%s)\n' \
      "$((10#$num))" "$(basename "$sheet")" "$(basename "$sheet")" > "$dir/README.md"
    echo "NEUER LÖSUNGSORDNER: ${dir#$ROOT/}"
    extract_attachments "$sheet" "$dir/vorgabe"
  done
}

sync_course() {
  local id="$1" url="$2" solutions="$3"
  local up; up="$(echo "$id" | tr '[:lower:]' '[:upper:]')"
  local user_var="${up}_USER" pass_var="${up}_PASS"
  local user="${!user_var:-${SYSPROG_USER:-}}" pass="${!pass_var:-${SYSPROG_PASS:-}}"
  local auth=()
  [[ -n "$user" ]] && auth=(-u "$user:$pass")

  mkdir -p "$ROOT/$id"
  local page="$ROOT/$id/.page.html"
  if ! curl -sfL -m 30 ${auth[@]+"${auth[@]}"} "$url" -o "$page"; then
    echo "FEHLER [$id]: Kursseite nicht erreichbar ($url)" >&2
    return 1
  fi

  local new=0 path dir name out before after
  while read -r path; do
    [[ -n "$path" ]] || continue
    dir="$ROOT/$id/$(target_dir "$path")"
    mkdir -p "$dir"
    name="$(basename "$path")"
    [[ "$name" == "gitignore" ]] && name="gitignore.txt"
    out="$dir/$name"
    before="$( [[ -f "$out" ]] && mtime "$out" || echo 0 )"
    if [[ -f "$out" ]]; then
      curl -sfL ${auth[@]+"${auth[@]}"} -R -z "$out" "$BASE_URL$path" -o "$out"
    else
      curl -sfL ${auth[@]+"${auth[@]}"} -R "$BASE_URL$path" -o "$out"
    fi || { echo "FEHLER [$id]: Download fehlgeschlagen: $path" >&2; continue; }
    after="$(mtime "$out")"
    if [[ "$before" != "$after" ]]; then
      echo "NEU/AKTUALISIERT: ${out#$ROOT/}"
      new=$((new + 1))
    fi
  done < <(grep -oE 'href="fileadmin/[^"]+\.[A-Za-z0-9]+"|href="fileadmin/[^"]+/gitignore"' "$page" \
            | sed 's/^href="//; s/"$//' | sort -u)

  [[ "$solutions" == "ja" ]] && make_solution_dirs "$id"
  echo "Fertig [$id]: $new neue/aktualisierte Datei(en)."
}

status=0
while IFS='|' read -r id url deck solutions; do
  [[ -z "$id" || "$id" == \#* ]] && continue
  if (( $# > 0 )); then
    [[ " $* " == *" $id "* ]] || continue
  fi
  sync_course "$id" "$url" "$solutions" || status=1
done < "$ROOT/courses.conf"

(( status == 0 )) && date '+%Y-%m-%d' > "$ROOT/.last_sync"
exit $status
