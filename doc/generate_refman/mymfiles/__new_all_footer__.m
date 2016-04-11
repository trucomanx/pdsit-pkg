function opt=__new_all_footer__(options)
	opt=options;

	%opt.index_footer= ...
    %    "<div id=\"sf_logo\">\n\
    %       <a href=\"http://sourceforge.net\">\
    %       <img src=\"http://sourceforge.net/sflogo.php?group_id=2888&amp;type=1\"\
    %        width=\"88\" height=\"31\" style=\"border: 0;\" alt=\"SourceForge.net Logo\"/>\
    %       </a>\n\
    %     </div>\n</div>\n</body>\n</html>\n";

	opt.index_footer= ...
        "<div id=\"sf_logo\">\n\
           <a href=\"http://trucomanx.github.io/pdsit-pkg/\">\
           <img src=\"https://assets-cdn.github.com/images/modules/logos_page/GitHub-Logo.png\"\
            height=\"31\" style=\"border: 0;\" alt=\"github.com Logo\"/>\
           </a>\n\
         </div>\n</div>\n</body>\n</html>\n";

	opt.overview_footer = [ ...
        "<p>Package: <a href=\"index.html\">%package</a></p>\n" ...
        opt.index_footer];



	opt.footer = [ ...
        "<p>Package: <a href=\"%pkgrootindex.html\">%package</a></p>\n" ...
        opt.index_footer];

end
