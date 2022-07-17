#!/bin/bash

wget -r 'https://www.unicode.org/charts/PDF/'  --accept-regex 'www.unicode.org/charts/PDF/U[0-9A-F]{4,6}.pdf$'

cd 'www.unicode.org/charts/PDF/'
rename -d 's/^U([0-9A-F]{4}).pdf$/U00$1.pdf/' *.pdf
rename -d 's/^U([0-9A-F]{5}).pdf$/U0$1.pdf/' *.pdf

gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=unicode.pdf U*.pdf
cd ../../..

mkdir -p 'out'
mv 'www.unicode.org/charts/PDF/unicode.pdf' 'out/unicode.pdf'
rm -rf 'www.unicode.org'
