%
addpath('mymfiles');

options = get_html_options ("octave-forge");

options=__new_header__(options);
options=__new_all_footer__(options);
options=__new_package_list_item__(options);
options=__new_download_link__(options);

generate_package_html ("pdsit", "pdsit_html",options)

copyfile("datafiles/octave-forge.css","pdsit_html/octave-forge.css");
copyfile("datafiles/fixed.js","pdsit_html/fixed.js");
copyfile("datafiles/javascript.js","pdsit_html/javascript.js");

copyfile("datafiles/doc.png","pdsit_html/doc.png");
copyfile("datafiles/download.png","pdsit_html/download.png");
copyfile("datafiles/news.png","pdsit_html/news.png");
copyfile("datafiles/oct.png","pdsit_html/oct.png");
copyfile("datafiles/favicon.ico","pdsit_html/favicon.ico");

rmpath('mymfiles');

