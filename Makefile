ALL: paper

paper:
	pdflatex paper && biber paper && pdflatex paper && pdflatex paper

clean: 
	rm -Rf *.aux *.dvi *.log *.blg *.toc *.lof *.lot *.bcf *.bbl paper.run.xml paper.pdf
	