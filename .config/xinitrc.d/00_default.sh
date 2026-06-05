# variables, can be set in ~/.Xprofile
SCALE=${SCALE:-1.0}
STARTUP=${STARTUP:-dwm}

# recommand explicitly set in ~/.Xprofile, like this
# unset DAEMONS
# DAEMONS="$DAEMONS;fcitx5"
# DAEMONS="$DAEMONS;picom --backend glx --vsync"
# DAEMONS="$DAEMONS;/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
DAEMONS="fcitx5;/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"

# command alias
dbus_update="dbus-update-activation-environment --verbose --systemd"
