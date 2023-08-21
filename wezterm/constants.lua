local wezterm = require("wezterm")

local constants = {
  font = wezterm.font({
    family = "NotoSansM Nerd Font",
    weight = "Regular",
    stretch = "Condensed",
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  }),
  font_size = 14.0,
  window_frame_font_size = 10.0,
  show_tabs = false,
}

return constants
