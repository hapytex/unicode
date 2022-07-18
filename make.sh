#!/bin/bash

set -e

dr=$(pwd)

tmp=$(mktemp -d)
cd "$tmp"
wget -q -r 'https://www.unicode.org/charts/PDF/'  --accept-regex 'www.unicode.org/charts/PDF/U[0-9A-F]{4,6}.pdf$'

cd 'www.unicode.org/charts/PDF/'
rename -d 's/^U([0-9A-F]{4}).pdf$/U00$1.pdf/' *.pdf
rename -d 's/^U([0-9A-F]{5}).pdf$/U0$1.pdf/' *.pdf

qpdf --empty --pages U*.pdf -- unicode.pdf

cd "$dr"
mkdir -p 'out'
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -sOutputFile=out/unicode.pdf "$tmp/www.unicode.org/charts/PDF/unicode.pdf"

rm -rf "$tmp"
