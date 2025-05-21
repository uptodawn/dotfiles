# HiDPI
SCALE=1.0
echo "Xft.dpi: $(echo 96*$SCALE/${SCALE%.*}/1 | bc)" | xrdb -merge
export GDK_SCALE=${SCALE%.*}
export GDK_DPI_SCALE=1
export QT_SCALE_FACTOR=${SCALE%.*}
export XCURSOR_SIZE=$(echo "24*$SCALE/1" | bc)
dbus-update-activation-environment --verbose --systemd \
	GDK_SCALE GDK_DPI_SCALE QT_SCALE_FACTOR XCURSOR_SIZE

# dunst
sed "s/@DUNST_FONT@/Monospace $((GDK_SCALE*11))/; s/@DUNST_SCALE@/$GDK_SCALE/" \
	~/.config/dunst/dunstrc.in > ~/.config/dunst/dunstrc
dunst &

# fcitx
fcitxconf=~/.config/fcitx5/conf/classicui.conf
sed "s/@FCITX5_FONT_SIZE@/$(($GDK_SCALE*10))/" $fcitxconf.in > $fcitxconf
fcitx5 -d

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
dbus-update-activation-environment --verbose --systemd \
	GTK_IM_MODULE QT_IM_MODULE XMODIFIERS SDL_IM_MODULE GLFW_IM_MODULE

# misc
picom &
dwmblocks &

unset LC_ALL
STARTUP=dwm
. /etc/X11/xinit/xinitrc
