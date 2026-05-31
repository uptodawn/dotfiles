SCALE=${SCALE:-1.0}
echo "Xft.dpi: $(echo 96*$SCALE/${SCALE%.*}/1 | bc)" | xrdb -merge
export GDK_SCALE=${SCALE%.*}
export GDK_DPI_SCALE=1
export QT_SCALE_FACTOR=$SCALE
export QT_ENABLE_HIGHDPI_SCALING=1
export QT_FONT_DPI=96
export XCURSOR_SIZE=$(echo "24*$SCALE/1" | bc)
dbus-update-activation-environment --verbose --systemd \
	GDK_SCALE GDK_DPI_SCALE QT_SCALE_FACTOR XCURSOR_SIZE \
	QT_ENABLE_HIGHDPI_SCALING QT_FONT_DPI

sed "s/@DUNST_FONT_SIZE@/$((${SCALE%.*}*11))/; s/@DUNST_SCALE@/${SCALE%.*}/" \
	$HOME/.config/dunst/dunstrc.in > $HOME/.config/dunst/dunstrc

fcitxconf=$HOME/.config/fcitx5/conf/classicui.conf
sed "s/@FCITX_FONT_SIZE@/$((${SCALE%.*}*11))/" $fcitxconf.in > $fcitxconf
