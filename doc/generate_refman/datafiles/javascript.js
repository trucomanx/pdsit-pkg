/* Copyright (C) 2008 Soren Hauberg

This program is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; see the file COPYING.  If not, see
<http://www.gnu.org/licenses/>.
*/

var cookie_name = "octave_forge_cookie";

function set_cookie(val)
{
    if (document.cookie != document.cookie) {
        index = document.cookie.indexOf(cookie_name);
    } else {
        index = -1;
    }
    if (index == -1) {
        var cval = cookie_name + "=" + val + "; ";
        var d = new Date();
        d.setSeconds(d.getSeconds()+30);
        cval = cval + "expires=" + d.toString() + ";";
        document.cookie = cval;
    }
}

function get_cookie()
{
    var retval = -1;
    if (document.cookie) {
        var index = document.cookie.indexOf(cookie_name);
        if (index != -1) {
            var start = document.cookie.indexOf("=", index) + 1;
            stop = document.cookie.indexOf(";", start);
            if (stop == -1) {
                stop = document.cookie.length;
            }
            retval = document.cookie.substring(start, stop);
        }
    }
    return retval;
}

function goto_url (selSelectObject)
{
    if (selSelectObject.options[selSelectObject.selectedIndex].value != "-1") {
        location.href=selSelectObject.options[selSelectObject.selectedIndex].value;
    }
}

function unfold(id)
{
    if (document.getElementById(id+"_detailed").style.display == "none") {
        document.getElementById(id+"_detailed").style.display = "block";
        document.getElementById(id+"_im").src ="hide.png"
    } else {
        document.getElementById(id+"_detailed").style.display = "none";
        document.getElementById(id+"_im").src ="show.png"
    }
}

function fold(id)
{
    document.getElementById(id+"_detailed").style.display = "none";
    document.getElementById(id).style.display = "block";
}

function show_left_menu ()
{
  document.getElementById ("left-menu").style.display = "block";
}

function manual_menu ()
{
  // XXX: What should we do here? And do we even need this function?
  write_left_menu ();
}
