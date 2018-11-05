default: spice_impedance_synthesis_manual.pdf

LATEX_FILES= \
 Tex/introduction.tex \
 Tex/spice_impedance_synthesis.tex \
 Tex/bibliography.tex

spice_impedance_synthesis_manual.pdf: spice_impedance_synthesis.tex  $(LATEX_FILES)
	pdflatex spice_impedance_synthesis.tex 
	pdflatex spice_impedance_synthesis.tex 
	pdflatex spice_impedance_synthesis.tex 

clean:
	rm -f *.aux *.lof *.log  *.out  *.toc *.pdf

