local wezterm = require("wezterm")
local act = wezterm.action

return {
  -- Ctrl-Click opens the hyperlink
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = act.OpenLinkAtMouseCursor,
  },
}
