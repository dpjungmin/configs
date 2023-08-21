local wezterm = require("wezterm")

wezterm.on("gui-startup", function(cmd)
  wezterm.log_info(cmd)
end)

wezterm.on("update-status", function(window, pane)
  local akt = window:active_key_table()
  local meta = pane:get_metadata() or {}

  local left_status
  local right_status

  if meta.password_input then
    left_status = "password input"
  end

  if akt then
    right_status = "active key table: " .. akt
  end

  window:set_left_status(left_status or "")
  window:set_right_status(right_status or "")
end)

wezterm.on("toggle-opacity", function(window, _)
  local overrides = window:get_config_overrides() or {}

  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.8
  else
    overrides.window_background_opacity = nil
  end

  window:set_config_overrides(overrides)
  window:toast_notification("wezterm", "event: toggle-opacity", nil, 4000)
end)
