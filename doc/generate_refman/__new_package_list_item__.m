function opt=__new_package_list_item__(options)
	opt=options;
	opt.package_list_item = ...
"<h3 class=\"package_name\" id=\"%name\"><a class=\"package_name\" href=\"./%name/index.html\">%name</a></h3>\n\
<p class=\"package_desc\">%shortdescription</p>\n\
<p>\n\
<a class=\"package_link\" href=\"./%name/index.html\">details</a>\n\
<a class=\"download_link\" href=\"http://downloads.sourceforge.net/octave/%name-%version.%extension?download\">download</a>\n\
</p>\n";

	
end
