AutoHotTip is an AutoHotKey script that displays random tips based on the
active application. AutoHotKey needs to be installed to run the script.

http://www.autohotkey.com/

By default, it uses Growl for Windows to do the notifications. This means that
you need to have Growl for Windows installed and running.

http://www.growlforwindows.com/

All .tips files in the same folder as the script get loaded by the script.

The first line in a .tips file indicates what must be in the window title of
the active application. All of the other lines are the tips that can be
displayed. If a tip has a - character in it, the part of the line before the -
becomes the title of the tip and the part of the line after the - becomes the
description of the tip. The - character must be surrounded by at least on space
on both sides or it isn't considered a separator.

The default icon used by AutoHotTip was found here:

http://www.geekpedia.com/icon744_Light-Bulb.html
