#!/bin/sh

# runs automatically after you run startx

[ -f $HOME/.config/x11/xprofile ] && . /$HOME/.config/x11/xprofile

exec dwm
