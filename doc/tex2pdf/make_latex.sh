#!/bin/bash


pdflatex hb_func
pdflatex hb_func

pdflatex hb_ifunc
pdflatex hb_ifunc

pdflatex pds_shu0omega
pdflatex pds_shu0omega

pdflatex pds_shomega
pdflatex pds_shomega

pdflatex pds_bersbceo
pdflatex pds_bersbceo

./clean_latex.sh
