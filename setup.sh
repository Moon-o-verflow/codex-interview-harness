#!/usr/bin/env bash
# Usage (from the workspace root):
#   git clone https://github.com/Moon-o-verflow/codex-interview-harness.git .harness && bash .harness/setup.sh
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
DST="$(pwd)"
[ "$SRC" = "$DST" ] && { echo "작업 폴더 루트에서 실행하세요."; exit 1; }
[ -f README.md ] || echo "경고: README.md가 없습니다. 작업 폴더 루트가 맞는지 확인하세요."

copy() {
  if [ -e "$2" ]; then
    echo "건너뜀 (이미 있음): $2"
  else
    mkdir -p "$(dirname "$2")"
    cp -R "$1" "$2"
    echo "복사: $2"
  fi
}

copy "$SRC/AGENTS.md" AGENTS.md
for f in coach prd impl; do copy "$SRC/roles/$f.md" "roles/$f.md"; done
for s in change-procedure doc-split wrap-up; do copy "$SRC/.agents/skills/$s" ".agents/skills/$s"; done
for t in interview spec tasks; do copy "$SRC/templates/$t.md" "docs/$t.md"; done

# .gitignore: append missing lines only
touch .gitignore
while IFS= read -r line; do
  [ -z "$line" ] && continue
  grep -qxF -- "$line" .gitignore || echo "$line" >> .gitignore
done < "$SRC/.gitignore"
rel="$(realpath --relative-to="$DST" "$SRC")"
case "$rel" in
  ..*) ;;
  *) grep -qxF "$rel/" .gitignore || echo "$rel/" >> .gitignore ;;
esac

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || git init -q
git config user.name >/dev/null || git config user.name "candidate"
git config user.email >/dev/null || git config user.email "candidate@localhost"
git add -A
git commit -qm "setup: harness" >/dev/null 2>&1 || echo "커밋할 변경 없음"
git tag -f setup >/dev/null

echo "완료. AGENTS.md의 [TBD] 2곳(납기, 범위)을 채우세요."
