SCALE=${SCALE:-1.0}
echo "Xft.dpi: $(echo 96*$SCALE/1 | bc)" | xrdb -merge
export GDK_SCALE=${SCALE%.*}
export GDK_DPI_SCALE=$(printf "%.2f" $(echo "scale=2; 1/${SCALE%.*}" | bc))
export QT_SCALE_FACTOR=$SCALE
export QT_ENABLE_HIGHDPI_SCALING=1
export QT_FONT_DPI=96
export XCURSOR_SIZE=$(echo "24*$SCALE/1" | bc)
dbus-update-activation-environment --verbose --systemd \
	GDK_SCALE GDK_DPI_SCALE QT_SCALE_FACTOR XCURSOR_SIZE \
	QT_ENABLE_HIGHDPI_SCALING QT_FONT_DPI

sed "s/@DUNST_SCALE@/${SCALE%.*}/" \
	$HOME/.config/dunst/dunstrc.in > $HOME/.config/dunst/dunstrc

sed "s/@ROFI_DPI@/$(echo 96*$SCALE/1 | bc)/" \
	$HOME/.config/rofi/config.rasi.in > $HOME/.config/rofi/config.rasi

sed "s/@ELECTRON_SCALE@/$SCALE/" \
	$HOME/.config/electron-flags.conf.in > $HOME/.config/electron-flags.conf
