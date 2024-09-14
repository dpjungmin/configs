local constants = require("constants")

local module = {}

local palette = {
  foreground = "#e0def4",
  background = "#232136",

  black = "#393552",
  red = "#eb6f92",
  green = "#98c379",
  yellow = "#f6c177",
  blue = "#6e90b0",
  magenta = "#c4a7e7",
  cyan = "#7bbfb4",
  white = "#e0def4",

  bright_black = "#6e6a86",
  bright_red = "#b84d51",
  bright_green = "#98c379",
  bright_yellow = "#e58a50",
  bright_blue = "#56b6c2",
  bright_magenta = "#c4a7e7",
  bright_cyan = "#4d7b74",
  bright_white = "#5a626a",

  accent = "#30dff3",
  border = "#000000",
  selection = "#e58a50",
  gradient = {
    "#2b2539",
    "#2b2539",
    "#2b2539",
  },
}

function module.paint(config)
  config.colors = {
    foreground = palette.foreground,
    background = palette.background,

    cursor_fg = "#000000",
    cursor_bg = "#00ff00",
    cursor_border = "#ff0000",

    selection_fg = palette.background,
    selection_bg = palette.selection,

    scrollbar_thumb = palette.black,
    split = palette.black,

    ansi = {
      palette.black,
      palette.red,
      palette.green,
      palette.yellow,
      palette.blue,
      palette.magenta,
      palette.cyan,
      palette.white,
    },

    brights = {
      palette.bright_black,
      palette.bright_red,
      palette.bright_green,
      palette.bright_yellow,
      palette.bright_blue,
      palette.bright_magenta,
      palette.bright_cyan,
      palette.bright_white,
    },

    compose_cursor = "orange",

    tab_bar = {
      background = palette.background,
      inactive_tab_edge = palette.background,

      active_tab = {
        fg_color = palette.green,
        bg_color = palette.black,
      },

      inactive_tab = {
        fg_color = palette.bright_white,
        bg_color = palette.black,
      },

      inactive_tab_hover = {
        fg_color = palette.bright_white,
        bg_color = palette.black,
      },

      new_tab = {
        fg_color = palette.bright_white,
        bg_color = palette.black,
      },

      new_tab_hover = {
        fg_color = palette.accent,
        bg_color = palette.black,
      },
    },
  }

  config.command_palette_fg_color = palette.foreground
  config.command_palette_bg_color = palette.black
  config.command_palette_font_size = 16.0

  -- https://wezfurlong.org/wezterm/config/lua/config/window_background_gradient.html
  config.window_background_gradient = {
    orientation = "Vertical",
    colors = palette.gradient,
  }

  config.window_frame = {
    font = constants.font,
    font_size = constants.show_tabs and constants.window_frame_font_size or 0.2,
    inactive_titlebar_bg = palette.background,
    active_titlebar_bg = palette.background,
    inactive_titlebar_fg = palette.foreground,
    active_titlebar_fg = "#00ff00",
    inactive_titlebar_border_bottom = "none",
    active_titlebar_border_bottom = "none",
    button_fg = "none",
    button_bg = "none",
    button_hover_fg = "none",
    button_hover_bg = "none",
    border_left_width = "0.4cell",
    border_right_width = "0.4cell",
    border_bottom_height = "0.2cell",
    border_top_height = "0.2cell",
    border_left_color = palette.border,
    border_right_color = palette.border,
    border_bottom_color = palette.border,
    border_top_color = palette.border,
  }

  config.text_background_opacity = 1.0
  config.window_background_opacity = 1.0
  config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.5,
  }

  return config
end

return module
