######################################################################
# Project: AllTheDBTheory
# File:	   Makefile
######################################################################

BUILD		= notes

RELEASE		= AllTheDBTheory

PARTS		= chapters/functional_dependency \
			  chapters/normal_forms \
			  chapters/relational_algebra \
			  chapters/implementation \
			  appendices/er_diagrams \
			  appendices/SQL

FIGURES 	= figs/entity.png \
			  figs/strong_entity.png \
			  figs/weak_entity.png \
			  figs/alternate_entity.png \
			  figs/relationship.png

TEX     	= pdflatex
TEXOPTS 	= -halt-on-error

######################################################################
# The following are derived variables and targets, do not touch
# unless you know exactly what you are doing.
######################################################################

MAIN_TEX	= ${BUILD}.tex

PARTS_TEX	= ${addsuffix .tex,${PARTS}} 

BUILD_PDF   = ${BUILD}.pdf

RELEASE_PDF	= ${RELEASE}.pdf

.PHONY: open clean release

open: ${BUILD_PDF}
	open $< || gnome-open $<

${BUILD_PDF}: ${MAIN_TEX} ${PARTS_TEX} ${FIGURES}
	${TEX} ${TEXOPTS} $< 
	${TEX} ${TEXOPTS} $<

clean:
	rm -f *.log *.aux *.dvi ${BUILD_PDF}

release: ${BUILD_PDF}
	cp ${BUILD_PDF} ${RELEASE_PDF}
