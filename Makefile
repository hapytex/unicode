all: out/unicode.pdf.gz:

out/unicode.pdf: install.sh
	bash make.sh

%.gz: %
	gzip "$^"
