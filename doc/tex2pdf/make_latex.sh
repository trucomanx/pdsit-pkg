#!/bin/bash


pdflatex hb_func
pdflatex hb_func

pdflatex hb_ifunc
pdflatex hb_ifunc

pdflatex pds_shu0omega
pdflatex pds_shu0omega

pdflatex hb_joint_sbceo
pdflatex hb_joint_sbceo

pdflatex ber_sbceo
pdflatex ber_sbceo

./clean_latex.sh
