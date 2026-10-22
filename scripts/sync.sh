#!/usr/bin/env bash
# Lädt alle Materialien (PDFs, Zusatzdateien) der SysProg-Webseite herunter.
# Neue oder auf dem Server geänderte Dateien werden geholt, vorhandene übersprungen.
# Zugangsdaten (falls außerhalb des Uni-Netzes nötig) kommen aus .env.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PAGE_URL="https://net.cs.uni-bonn.de/de/wg/cs/lehre/ws-202627/sysprog/"
BASE_URL="https://net.cs.uni-bonn.de/"

# Datei-Zeitstempel (Sekunden) – macOS (BSD stat) und Linux (GNU stat)
mtime() { stat -f %m "$1" 2>/dev/null || stat -c %Y "$1"; }

AUTH=()
if [[ -f "$ROOT/.env" ]]; then
  # shellcheck disable=SC1091
  source "$ROOT/.env"
  [[ -n "${SYSPROG_USER:-}" ]] && AUTH=(-u "$SYSPROG_USER:$SYSPROG_PASS")
fi

curl -sfL -m 30 "${AUTH[@]}" "$PAGE_URL" -o "$ROOT/.page.html" \
  || { echo "FEHLER: Kursseite nicht erreichbar ($PAGE_URL)" >&2; exit 1; }

target_dir() {
  case "$1" in
    */Folien/*)      echo "Folien" ;;
    */UeZettel/*)    echo "Übungszettel" ;;
    */Altklausuren/*) echo "Altklausuren" ;;
    *)               echo "Material" ;;
  esac
}

new=0
while read -r path; do
  dir="$ROOT/$(target_dir "$path")"
  name="$(basename "$path")"
  [[ "$name" == "gitignore" ]] && name="gitignore.txt"
  out="$dir/$name"
  before="$( [[ -f "$out" ]] && mtime "$out" || echo 0 )"
  if [[ -f "$out" ]]; then
    curl -sfL "${AUTH[@]}" -R -z "$out" "$BASE_URL$path" -o "$out"
  else
    curl -sfL "${AUTH[@]}" -R "$BASE_URL$path" -o "$out"
  fi
  after="$(mtime "$out")"
  if [[ "$before" != "$after" ]]; then
    echo "NEU/AKTUALISIERT: ${out#$ROOT/}"
    new=$((new + 1))
  fi
done < <(grep -oE 'href="fileadmin/ag/martini/lehre/[^"]+"' "$ROOT/.page.html" \
          | sed 's/^href="//; s/"$//' | sort -u)

echo "Fertig: $new neue/aktualisierte Datei(en)."
date '+%Y-%m-%d' > "$ROOT/.last_sync"
