function opt=__new_header__(options)
	opt=options;
	opt.header = "\
<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\n\
 \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n\
<html xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"en\" xml:lang=\"en\">\n\
  <head>\n\
  <meta http-equiv=\"content-type\" content=\"text/html; charset=%charset\" />\n\
  <meta name=\"date\" content=\"%date\"/>\n\
  <meta name=\"author\" content=\"Fernando Pujaico Rivera\" />\n\
  <meta name=\"description\" content=\"Package\
   providing extra functionality for GNU Octave.\" />\n\
  <meta name=\"keywords\" lang=\"en\" content=\"Octave, extra packages\" />\n\
  <title>%title</title>\n\
  <link rel=\"stylesheet\" type=\"text/css\" href=\"%root%css\" />\n\
  <script src=\"%rootfixed.js\" type=\"text/javascript\"></script>\n\
  <script src=\"%rootjavascript.js\" type=\"text/javascript\"></script>\n\
  <link rel=\"shortcut icon\" href=\"%rootfavicon.ico\" />\n\
  </head>\n\
  <body %body_command>\n\
  <div id=\"top-menu\" class=\"menu\">\n\
   <table class=\"menu\">\n\
      <tr>\n\
        <td style=\"width: 90px;\" class=\"menu\" rowspan=\"2\">\n\
          <a name=\"top\">\n\
          <img src=\"%rootoct.png\" alt=\"Octave logo\" />\n\
          </a>\n\
        </td>\n\
        <td class=\"menu\" style=\"padding-top: 0.9em;\">\n\
          <big class=\"menu\">PDS Library for Octave</big><small class=\"menu\"> - Extra packages for GNU Octave</small>\n\
        </td>\n\
      </tr>\n\
      <tr>\n\
        <td class=\"menu\">\n\
\n\
 <a href=\"%pkgrootindex.html\" class=\"menu\">Home</a> &middot;\n\
 <a href=\"%pkgrootoverview.html\" class=\"menu\">Referece</a> &middot;\n\
 <a href=\"https://github.com/trucomanx/pdsit-pkg\" class=\"menu\">Code</a>\n\
\n\
        </td>\n\
      </tr>\n\
    </table>\n\
  </div>\n\
<div id=\"left-menu\">\n\
  <h3>Navigation</h3>\n\
  <p class=\"left-menu\"><a class=\"left-menu-link\" href=\"http://octave.sourceforge.net/operators.html\">Operators and Keywords</a></p>\n\
  <p class=\"left-menu\"><a class=\"left-menu-link\" href=\"http://octave.sourceforge.net/function_list.html\">Function List:</a></p>\n\
  <ul class=\"left-menu-list\">\n\
    <li class=\"left-menu-list\">\n\
      <a  class=\"left-menu-link\" href=\"http://octave.sourceforge.net/octave/overview.html\">&#187; Octave core</a>\n\
    </li>\n\
    <li class=\"left-menu-list\">\n\
      <a  class=\"left-menu-link\" href=\"http://octave.sourceforge.net/functions_by_package.php\">&#187; by package</a>\n\
    </li>\n\
    <li class=\"left-menu-list\">\n\
      <a  class=\"left-menu-link\" href=\"http://octave.sourceforge.net/functions_by_alpha.php\">&#187; alphabetical</a>\n\
    </li>\n\
  </ul>\n\
  <p class=\"left-menu\"><a class=\"left-menu-link\" href=\"http://octave.sourceforge.net/doxygen/html\">C++ API</a></p>\n\
</div>\n\
<div id=\"doccontent\">\n";

end


%{
	opt.header = "\
<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\n\
 \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n\
<html xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"en\" xml:lang=\"en\">\n\
  <head>\n\
  <meta http-equiv=\"content-type\" content=\"text/html; charset=%charset\" />\n\
  <meta name=\"date\" content=\"%date\"/>\n\
  <meta name=\"author\" content=\"The Octave-Forge Community\" />\n\
  <meta name=\"description\" content=\"Octave-Forge is a collection of packages\
   providing extra functionality for GNU Octave.\" />\n\
  <meta name=\"keywords\" lang=\"en\" content=\"Octave-Forge, Octave, extra packages\" />\n\
  <title>%title</title>\n\
  <link rel=\"stylesheet\" type=\"text/css\" href=\"%root%css\" />\n\
  <script src=\"%rootfixed.js\" type=\"text/javascript\"></script>\n\
  <script src=\"%rootjavascript.js\" type=\"text/javascript\"></script>\n\
  <link rel=\"shortcut icon\" href=\"%rootfavicon.ico\" />\n\
  </head>\n\
  <body %body_command>\n\
  <div id=\"top-menu\" class=\"menu\">\n\
   <table class=\"menu\">\n\
      <tr>\n\
        <td style=\"width: 90px;\" class=\"menu\" rowspan=\"2\">\n\
          <a name=\"top\">\n\
          <img src=\"%rootoct.png\" alt=\"Octave logo\" />\n\
          </a>\n\
        </td>\n\
        <td class=\"menu\" style=\"padding-top: 0.9em;\">\n\
          <big class=\"menu\">Octave-Forge</big><small class=\"menu\"> - Extra packages for GNU Octave</small>\n\
        </td>\n\
      </tr>\n\
      <tr>\n\
        <td class=\"menu\">\n\
\n\
 <a href=\"%rootindex.html\" class=\"menu\">Home</a> &middot;\n\
 <a href=\"%rootpackages.php\" class=\"menu\">Packages</a> &middot;\n\
 <a href=\"%rootdevelopers.html\" class=\"menu\">Developers</a> &middot;\n\
 <a href=\"%rootdocs.html\" class=\"menu\">Documentation</a> &middot;\n\
 <a href=\"%rootFAQ.html\" class=\"menu\">FAQ</a> &middot;\n\
 <a href=\"%rootbugs.html\" class=\"menu\">Bugs</a> &middot;\n\
 <a href=\"%rootarchive.html\" class=\"menu\">Mailing Lists</a> &middot;\n\
 <a href=\"%rootlinks.html\" class=\"menu\">Links</a> &middot;\n\
 <a href=\"http://octave.sourceforge.net/code.html\" class=\"menu\">Code</a>\n\
\n\
        </td>\n\
      </tr>\n\
    </table>\n\
  </div>\n\
<div id=\"left-menu\">\n\
  <h3>Navigation</h3>\n\
  <p class=\"left-menu\"><a class=\"left-menu-link\" href=\"%rootoperators.html\">Operators and Keywords</a></p>\n\
  <p class=\"left-menu\"><a class=\"left-menu-link\" href=\"%rootfunction_list.html\">Function List:</a></p>\n\
  <ul class=\"left-menu-list\">\n\
    <li class=\"left-menu-list\">\n\
      <a  class=\"left-menu-link\" href=\"%rootoctave/overview.html\">&#187; Octave core</a>\n\
    </li>\n\
    <li class=\"left-menu-list\">\n\
      <a  class=\"left-menu-link\" href=\"%rootfunctions_by_package.php\">&#187; by package</a>\n\
    </li>\n\
    <li class=\"left-menu-list\">\n\
      <a  class=\"left-menu-link\" href=\"%rootfunctions_by_alpha.php\">&#187; alphabetical</a>\n\
    </li>\n\
  </ul>\n\
  <p class=\"left-menu\"><a class=\"left-menu-link\" href=\"%rootdoxygen/html\">C++ API</a></p>\n\
</div>\n\
<div id=\"doccontent\">\n";
%}
