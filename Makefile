# Makefile
MAIN = main
LATEX = xelatex
LATEX_FLAGS = -interaction=nonstopmode -halt-on-error

.PHONY: all clean distclean

all:
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

clean:
	rm -f *.aux *.log *.out *.toc *.bbl *.blg *.fls *.fdb_latexmk *.lof *.lot *.nav *.snm *.vrb *.xdv

distclean: clean
	rm -f $(MAIN).pdf
