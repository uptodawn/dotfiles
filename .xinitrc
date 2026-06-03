#!/bin/sh

[ ! -f "$HOME/.Xresources" ] || xrdb -merge "$HOME/.Xresources"
[ ! -f "$HOME/.Xmodmap" ] || xmodmap "$HOME/.Xmodmap"
[ ! -f "$HOME/.Xprofile" ] || . "$HOME/.Xprofile"

for i in /etc/X11/xinit/xinitrc.d/?*.sh; do
	[ ! -x "$i" ] || . "$i"
done

for i in $HOME/.config/xinitrc.d/?*.sh; do
	[ ! -x "$i" ] || . "$i"
done
