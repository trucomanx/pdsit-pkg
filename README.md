# pdsit-pkg

## Welcome to PDSIT Package
This package is a set of functions for to work with Digital Signal Processing 
in Information Theory.

## Citations
To cite PDSIT package in publications, use:

	Fernando Pujaico (2015).
	PDSIT - Software package for digital signal processing in information theory.
	URL http://trucomanx.github.io/pdsit-pkg

A BibTeX entry for LaTeX users is:

	@software{PDSIT,
		author    = {Fernando Pujaico},
		title     = {{PDSIT} Software package for digital signal 
					processing in information theory},
		year      = {2015},
		version   = {1.0.0},
		url       = {http://trucomanx.github.io/pdsit-pkg}
	}

We have invested a lot of time and effort in creating PDSIT, please cite it
when using it.

## Install

### In MATLAB or OCTAVE
For install the library in MATLAB, unzip the pdsit-pkg.tar.gz bellow path

	%USERPROFILE%\lib\octmat

where %USERPROFILE% represent the home profile directory; for example: 

	C:\Users\username\lib\octmat

The PDSIT package will be unziped (installed) in:

	C:\Users\username\lib\octmat\pdsit-pkg

For to load the PDSIT package in MATLAB, type the next MATLAB code:

	SOURCECODE='C:\Users\username\lib\octmat\pdsit-pkg\pdsit';
	addpath(genpath(SOURCECODE));

### Only in OCTAVE
The next OCTAVE code install the PDSIT package in the directory ~/lib/octmat

	pkg prefix ~/lib/octmat
	pkg install pdsit-pkg.tar.gz

The package is configured for be loaded by default.

## License
See [LICENSE](https://github.com/trucomanx/pdsit-pkg/blob/master/COPYING).

## Authors and Contributors
This package was wrote by @trucomanx.

## Support or Contact
Having trouble with package? Check out our 
[documentation](https://github.com/trucomanx/pdsit-pkg/tree/master/doc) or 
[contact support](https://github.com/trucomanx).

## Home Page
[http://trucomanx.github.io/pdsit-pkg](http://trucomanx.github.io/pdsit-pkg).

