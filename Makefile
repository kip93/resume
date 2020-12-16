# This is only intended to be used to build the example for this repo, but might
# prove to be of help to the more curious. This shows how to compile the LaTeX
# file and clean up, as well as how to create preview images.
#
# * To build the example, simply run the command `make` on the project root.
# * To only build the pdf without the PNG preview, run `make pdf`.
# * To clean up the project, run `make clean`.

png: pdf
	pdftoppm example.pdf example -png

pdf:
	printf 'H\nX\n' | pdflatex example.tex -pdf

clean:
	rm -rf *.pdf *.log *.aux *.out
	find -regex '^.+\-[0-9]+\.png' -delete
