export QT_QPA_PLATFORMTHEME=${QT_QPA_PLATFORMTHEME:-gtk3}
$dbus_update QT_QPA_PLATFORMTHEME

[ ! -r $HOME/.fehbg ] || . $HOME/.fehbg
