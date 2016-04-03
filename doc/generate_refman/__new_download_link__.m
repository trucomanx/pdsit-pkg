function opt=__new_download_link__(options)
	opt=options;
	%opt.download_link = "http://downloads.sourceforge.net/octave/%name-%version.tar.gz?download";
	opt.download_link = "https://github.com/trucomanx/pdsit-pkg/tarball/master";

end
