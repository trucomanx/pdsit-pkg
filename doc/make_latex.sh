#!/bin/bash


pdflatex pds_hb
pdflatex pds_hb

pdflatex pds_hbinv
pdflatex pds_hbinv

pdflatex pds_shu0omega
pdflatex pds_shu0omega

pdflatex pds_bersbceo
pdflatex pds_bersbceo

./clean_latex.sh
