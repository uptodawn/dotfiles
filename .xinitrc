unset LC_ALL
export GDK_SCALE=2
export GDK_DPI_SCALE=1
export QT_SCALE_FACTOR=2
export XCURSOR_SIZE=$((GDK_SCALE*24))

picom &

dunstrc=/tmp/dunstrc.tmp
cp -L /etc/dunst/dunstrc $dunstrc
sed -i "s/\(^ *font[^0-9]*\).*$/\1$((GDK_SCALE*11))/" $dunstrc
sed -i "s/\(^ *scale[^0-9]*\).*$/\1$GDK_SCALE/" $dunstrc
dunst -conf $dunstrc &

[ -f ~/.xinputrc ] || fcitx5 -d

STARTUP=dwm
. /etc/X11/xinit/xinitrc
