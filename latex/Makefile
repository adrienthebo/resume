# Makefile

.PHONY: all clean

all: resume.pdf

%.pdf: %.tex
	pdflatex $< && pdflatex $<

clean: 
	rm -f resume.log resume.pdf
