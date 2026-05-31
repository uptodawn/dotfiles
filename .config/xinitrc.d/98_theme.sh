export QT_QPA_PLATFORMTHEME=${QT_QPA_PLATFORMTHEME:-qt5ct}
dbus-update-activation-environment --verbose --systemd \
	QT_QPA_PLATFORMTHEME
