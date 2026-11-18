#!/bin/sh
# Build files/cv.pdf from files/cv.html with LibreOffice (no extra packages).
# A4 page size and 14mm margins are set here, because LibreOffice's HTML import
# always starts from Letter with its own margins.
set -eu
cd "$(dirname "$0")"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

soffice --headless --infilter="HTML (StarWriter)" --convert-to odt --outdir "$tmp" cv.html >/dev/null 2>&1
mkdir "$tmp/x"
( cd "$tmp/x" && unzip -oq ../cv.odt )

python3 - "$tmp/x/styles.xml" <<'PY'
import re, sys
p = sys.argv[1]
s = open(p, encoding='utf-8').read()

def fix(tag):
    t = tag.group(0)
    t = re.sub(r'fo:page-width="[^"]*"', 'fo:page-width="8.27in"', t)
    t = re.sub(r'fo:page-height="[^"]*"', 'fo:page-height="11.69in"', t)
    for side in ('top', 'bottom', 'left', 'right'):
        t = re.sub(r'fo:margin-%s="[^"]*"' % side, 'fo:margin-%s="0.55in"' % side, t)
    return t

# Only the page setup, never paragraph spacing.
s = re.sub(r'<style:page-layout-properties[^>]*>', fix, s)
open(p, 'w', encoding='utf-8').write(s)
PY

( cd "$tmp/x" && zip -qr ../cv-a4.odt . )

soffice --headless --convert-to pdf --outdir "$tmp" "$tmp/cv-a4.odt" >/dev/null 2>&1
mv "$tmp/cv-a4.pdf" cv.pdf

pdfinfo cv.pdf | grep -E "^(Pages|Page size)"
