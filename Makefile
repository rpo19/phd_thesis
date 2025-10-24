# Main file (without extension)
MAIN = main

# XeLaTeX command
LATEX = xelatex
LATEX_FLAGS = -interaction=nonstopmode -halt-on-error

# Biber command
BIBER = biber

all: pdf biber finalpdf

.PHONY: pdf finalpdf biber

pdf:
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

biber:
	$(BIBER) $(MAIN)

finalpdf:
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex


# Clean auxiliary files recursively
clean:
	find . -type f \( \
		-name "*.aux" -o \
		-name "*.log" -o \
		-name "*.out" -o \
		-name "*.toc" -o \
		-name "*.bbl" -o \
		-name "*.blg" -o \
		-name "*.fls" -o \
		-name "*.fdb_latexmk" -o \
		-name "*.lof" -o \
		-name "*.lot" -o \
		-name "*.nav" -o \
		-name "*.snm" -o \
		-name "*.vrb" -o \
		-name "*.xdv" \
	\) -delete

spell:
	@if [ -z "$(FILE)" ]; then \
	    echo "Usage: make spell FILE=yourfile.tex"; exit 1; \
	fi
	aspell --mode=tex --lang=en_US check $(FILE)

# Remove everything including the PDF
distclean: clean
	find . -type f -name "*.pdf" -delete
