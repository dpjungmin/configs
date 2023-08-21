local wezterm = require("wezterm")
local act = wezterm.action

local function bind(mods, key, action)
  return {
    mods = mods,
    key = key,
    action = action,
  }
end

local function open_hyperlink(link)
  return wezterm.action_callback(function()
    wezterm.open_with(link)
  end)
end

return {
  bind("LEADER", "p", act.ActivateCommandPalette),
  bind("LEADER", "r", act.ActivateKeyTable({ name = "resize_pane", one_shot = false })),
  bind("LEADER", ".", act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" })),
  bind("LEADER", ",", act.ShowLauncherArgs({ flags = "FUZZY|TABS" })),

  bind("CTRL", "/", act.ShowDebugOverlay),
  bind("CTRL", "1", act.SwitchToWorkspace({ name = "default" })),
  bind("CTRL", "2", act.SwitchToWorkspace({ name = "work" })),

  bind("CTRL|SHIFT", "l", act.ShowLauncher),
  bind("CTRL|SHIFT", "b", act.EmitEvent("toggle-opacity")),
  bind("CTRL|SHIFT", "w", act.EmitEvent("setup-work-env")),

  bind("META", "Tab", act.TogglePaneZoomState),
  bind("META", "Enter", act.ToggleFullScreen),

  bind("META", "g", open_hyperlink("https://github.com/dpjungmin")),
  bind("META", "r", open_hyperlink("https://doc.rust-lang.org/std")),
  bind("META", "d", open_hyperlink("https://docs.rs")),

  bind("META", "1", act.ActivateTab(0)),
  bind("META", "2", act.ActivateTab(1)),
  bind("META", "3", act.ActivateTab(2)),
  bind("META", "4", act.ActivateTab(3)),
  bind("META", "5", act.ActivateTab(4)),
  bind("META", "5", act.ActivateTab(4)),

  bind("CMD", "y", act.SpawnCommandInNewTab({ args = { "top" } })),

  bind(
    "CTRL|CMD|META",
    "LeftArrow",
    act.Multiple({
      act.SendKey({ key = "l" }),
      act.SendKey({ key = "e" }),
      act.SendKey({ key = "f" }),
      act.SendKey({ key = "t" }),
    })
  ),
}
