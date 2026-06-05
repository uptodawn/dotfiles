# xorg
echo "Xft.dpi: $(echo 96*$SCALE/1 | bc)" | xrdb -merge

# gtk
export GDK_SCALE=${SCALE%.*}
export GDK_DPI_SCALE=$(printf "%.2f" $(echo "scale=2; 1/${SCALE%.*}" | bc))
$dbus_update GDK_SCALE GDK_DPI_SCALE

# qt
export QT_SCALE_FACTOR=$SCALE
export QT_ENABLE_HIGHDPI_SCALING=1
export QT_FONT_DPI=96
$dbus_update QT_SCALE_FACTOR QT_ENABLE_HIGHDPI_SCALING QT_FONT_DPI

export XCURSOR_SIZE=$(echo "24*$SCALE/1" | bc)
$dbus_update XCURSOR_SIZE

# various non-autoscale programs
sed "s/@ROFI_DPI@/$(echo 96*$SCALE/1 | bc)/" \
	$HOME/.config/rofi/config.rasi.in > $HOME/.config/rofi/config.rasi

sed "s/@ELECTRON_SCALE@/$SCALE/" \
	$HOME/.config/electron-flags.conf.in > $HOME/.config/electron-flags.conf
