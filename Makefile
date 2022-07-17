all: out/unicode.pdf.gz

install:
	apt-get install -y ghostscript rename

out/unicode.pdf: make.sh
	bash make.sh

%.gz: %
	gzip "$^"
