all: out/unicode.pdf.gz

install:
	apt-get install -y ghostscript qpdf rename

out/unicode.pdf: make.sh
	bash make.sh

%-dark.pdf: %.pdf
	gs -o "$@" -sDEVICE=pdfwrite -c "{1 exch sub}{1 exch sub}{1 exch sub}{1 exch sub} setcolortransfer" -f "$^"

%.gz: %
	gzip -k -n --best "$^"
