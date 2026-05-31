fcitx5 -d

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
dbus-update-activation-environment --verbose --systemd \
	GTK_IM_MODULE QT_IM_MODULE XMODIFIERS SDL_IM_MODULE GLFW_IM_MODULE
