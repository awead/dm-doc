all: paper pdfa

paper:
	pdflatex paper && biber paper && pdflatex paper && pdflatex paper && pdflatex paper

clean: 
	rm -Rf *.aux *.dvi *.log *.blg *.toc *.lof *.lot *.bcf *.bbl paper.run.xml paper.pdf paper-diff.*

diff:
	latexdiff --flatten tmp/dm-doc/paper.tex paper.tex > paper-diff.tex
	pdflatex paper-diff && biber paper-diff && pdflatex paper-diff && pdflatex paper-diff

pdfa:
	gs -dPDFA -dBATCH -dNOPAUSE -dUseCIEColor -sProcessColorModel=DeviceCMYK -sDEVICE=pdfwrite -sPDFACompatibilityPolicy=1 -sOutputFile=paper-pdf-a.pdf paper.pdf pdfmarks
	