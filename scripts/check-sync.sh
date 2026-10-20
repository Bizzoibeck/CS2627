#!/usr/bin/env bash
# Hook für Claude Code (UserPromptSubmit): ist der letzte Abgleich mehr als
# MAX_AGE_DAYS her, wird sync.sh ausgeführt und das Ergebnis als Kontext ausgegeben.
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MAX_AGE_DAYS=3

last="$(cat "$ROOT/.last_sync" 2>/dev/null || echo 1970-01-01)"
last_ts="$(date -j -f %Y-%m-%d "$last" +%s 2>/dev/null || date -d "$last" +%s 2>/dev/null || echo 0)"
age_days=$(( ($(date +%s) - last_ts) / 86400 ))
(( age_days < MAX_AGE_DAYS )) && exit 0

echo "[SysProg-Sync] Letzter Abgleich vor $age_days Tagen ($last). Prüfe Webseite auf neue Dateien ..."
if out="$("$ROOT/scripts/sync.sh" 2>&1)"; then
  echo "$out"
  echo "[SysProg-Sync] Falls neue Dateien geladen wurden: dem Nutzer mitteilen, README (Termine/Inhalte) prüfen und ggf. aktualisieren."
else
  echo "[SysProg-Sync] Abgleich fehlgeschlagen: $out"
fi
exit 0
