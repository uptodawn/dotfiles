unset LC_ALL
export GDK_SCALE=2
export GDK_DPI_SCALE=1
export QT_SCALE_FACTOR=2
export XCURSOR_SIZE=$((GDK_SCALE*24))

dbus-update-activation-environment --verbose --systemd \
	GDK_SCALE GDK_DPI_SCALE QT_SCALE_FACTOR XCURSOR_SIZE

picom &
dwmblocks &

# dunst
dunstrc=/tmp/dunstrc.tmp
cp -L ~/.config/dunst/dunstrc $dunstrc
sed -i "s/\(^ *font[^0-9]*\).*$/\1$((GDK_SCALE*11))/" $dunstrc
sed -i "s/\(^ *scale[^0-9]*\).*$/\1$GDK_SCALE/" $dunstrc
dunst -conf $dunstrc &

# fcitx
fcitxconf=~/.config/fcitx5/conf/classicui.conf
[ -f $fcitxconf ] || echo "Font=\"Sans 10\"" > $fcitxconf
sed -i "s/\(^Font[^0-9]*\).*$/\1$((GDK_SCALE*10))\"/" $fcitxconf
fcitx5 -d

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

dbus-update-activation-environment --verbose --systemd \
	GTK_IM_MODULE QT_IM_MODULE XMODIFIERS SDL_IM_MODULE GLFW_IM_MODULE

STARTUP=dwm
. /etc/X11/xinit/xinitrc
