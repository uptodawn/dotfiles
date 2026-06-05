export QT_QPA_PLATFORMTHEME=${QT_QPA_PLATFORMTHEME:-qt5ct}
$dbus_update QT_QPA_PLATFORMTHEME

[ ! -r $HOME/.fehbg ] || . $HOME/.fehbg
