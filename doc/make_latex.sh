#!/bin/bash

pdflatex pds_bersbceo
pdflatex pds_bersbceo

pdflatex pds_hb
pdflatex pds_hb

pdflatex pds_hbinv
pdflatex pds_hbinv

./clean_latex.sh
