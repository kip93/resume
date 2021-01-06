# This is only intended to be used to build the example for this repo, but might
# prove to be of help to the more curious. This shows how to compile the LaTeX
# file and clean up, as well as how to create preview images.
#
# * To build the example, simply run the command `make` on the project root.
# * To build the example with minimal output, run the command `make silent` (default).
# * To build the example with verbose output, run the command `make verbose`.
# * To build the example without exiting on errors, run the command `make interactive`.
# * To only build the pdf without the PNG preview, run `make pdf`.
# * To clean up the project, run `make clean`.

default: silent

silent: silentpng silentpdf
verbose: verbosepng verbosepdf
interactive: interactivepng interactivepdf

pdf: silentpdf
png: silentpng

silentpng: pdf
	pdftoppm example.pdf example -png

silentpdf:
	pdflatex -interaction=batchmode example.tex -pdf

verbosepng: verbosepdf
	pdftoppm example.pdf example -png

verbosepdf:
	pdflatex -halt-on-error example.tex -pdf

interactivepng: interactivepdf
	pdftoppm example.pdf example -png

interactivepdf:
	pdflatex example.tex -pdf

clean:
	rm -rf *.aux *.log *.out *.pdf *.upa *.upb
	find -regex '^.+\-[0-9]+\.png' -delete
