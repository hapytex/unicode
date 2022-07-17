all: out/unicode.pdf.gz

install:
	apt-get install -y ghostscript rename

out/unicode.pdf: install.sh
	bash make.sh

%.gz: %
	gzip "$^"
