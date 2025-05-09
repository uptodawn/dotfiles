unset LC_ALL
#export GDK_SCALE=2
#export GDK_DPI_SCALE=1
#export QT_SCALE_FACTOR=2

picom --xrender-sync-fence &
STARTUP=dwm /etc/X11/xinit/xinitrc
