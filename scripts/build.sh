#!/bin/sh
# claude.ai 업로드용 .skill 파일 (skills/persona-play 를 묶은 zip)
set -e
cd "$(dirname "$0")/.."
mkdir -p dist
rm -f dist/persona-play.skill
(cd skills && zip -qr ../dist/persona-play.skill persona-play -x "*.DS_Store")
echo dist/persona-play.skill
