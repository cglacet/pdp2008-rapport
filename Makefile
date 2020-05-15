SRCS=$(wildcard *.tex)

INDEX=idx
SRC=rapport\(term\)
OUTEXT=pdf

TMP=*.aux *.log *.dvi *.toc *.bbl *.blg *.out *~

COMPIL=pdflatex
BIB=bibtex
IDX=makeindex
OPTIDX=-s index.ist


all : $(SRC)

clean :
	rm -f $(TMP) *.$(OUTEXT); cd Chapitres ; rm -f $(TMP)
	
$(SRC) : $(SRCS)
	$(BIB) $(SRC) ; $(COMPIL) $(SRC).tex ; $(IDX) $(OPTIDX) $(SRC).$(INDEX) ; $(BIB) $(SRC) ; $(COMPIL) $(SRC).tex ; $(COMPIL) $(SRC).tex
