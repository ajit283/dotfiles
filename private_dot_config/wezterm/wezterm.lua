-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Macchiato"
config.font = wezterm.font("Berkeley Mono")
-- Add frameless configuration
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 4,
	right = 4,
	top = 4,
	bottom = 4,
}

config.scrollback_lines = 1000000

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
-- config.window_background_opacity = 0.9
config.font_size = 16
config.line_height = 1.2
config.mouse_bindings = {
	-- Left click to move the cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		action = wezterm.action.CompleteSelection("PrimarySelection"),
	},
	-- Right click to paste at cursor location
	{
		event = { Up = { streak = 1, button = "Right" } },
		action = wezterm.action.PasteFrom("PrimarySelection"),
	},
	{
		event = { Down = { streak = 1, button = "Left" } },
		mods = "ALT",
		action = wezterm.action({ SelectTextAtMouseCursor = "Cell" }),
	},
}
-- and finally, return the configuration to wezterm
return config
