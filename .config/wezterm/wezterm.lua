local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("DejaVuSansM Nerd Font Mono")
config.colors = {
	background = "#1e1e1e"
}
config.hide_tab_bar_if_only_one_tab = true

return config
