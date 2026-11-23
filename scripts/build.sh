#!/bin/sh
# claude.ai 업로드용 .skill 파일 (skills/openpersona 를 묶은 zip)
set -e
cd "$(dirname "$0")/.."
mkdir -p dist
rm -f dist/openpersona.skill
(cd skills && zip -qr ../dist/openpersona.skill openpersona -x "*.DS_Store")
echo dist/openpersona.skill
