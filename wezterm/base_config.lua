local constants = require("constants")
local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font_dirs = { "fonts" }
config.font = constants.font
config.font_size = constants.font_size

config.cell_width = 1.0
config.check_for_updates = false
config.clean_exit_codes = { 130 }
config.cursor_thickness = "200%"
config.default_cursor_style = "SteadyBlock"
config.enable_scroll_bar = false
config.foreground_text_hsb = {
  hue = 1.0,
  saturation = 1.0,
  brightness = 1.0,
}
config.hide_tab_bar_if_only_one_tab = true
config.line_height = 1.0
config.macos_window_background_blur = 20
config.pane_focus_follows_mouse = true
config.scrollback_lines = 10000
config.set_environment_variables = {}
config.show_new_tab_button_in_tab_bar = false
config.show_tabs_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_bar_at_bottom = false
-- https://wezfurlong.org/wezterm/config/lua/config/term.html
config.term = "wezterm"
config.underline_position = "-5px"
config.underline_thickness = "200%"
config.unicode_version = 14
config.window_padding = {
  left = "2cell",
  right = "2cell",
  top = "1cell",
  bottom = "1cell",
}

return config
