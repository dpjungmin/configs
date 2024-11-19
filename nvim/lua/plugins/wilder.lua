return {
  "gelguy/wilder.nvim",
  event = "VimEnter",
  dependencies = { "romgrk/fzy-lua-native" },
  build = ":UpdateRemotePlugins",
  config = function()
    local wilder = require("wilder")

    wilder.setup({ modes = { ":", "/", "?" } })

    wilder.set_option("pipeline", {
      wilder.branch(
        wilder.python_file_finder_pipeline({
          file_command = { "rg", "--files" },
          dir_command = { "fd", "-td" },
          filters = { "fuzzy_filter", "difflib_sorter" },
        }),
        wilder.cmdline_pipeline(),
        wilder.python_search_pipeline()
      ),
    })

    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer({
        mode = "float",
        highlights = {
          default = "Pmenu",
          selected = "PmenuSel",
          error = "ErrorMsg",
          accent = "MatchAccent",
          selected_accent = "MatchAccentSel",
          empty_message = "WarningMsg",
        },
        ellipsis = "..",
        left = { " ", wilder.popupmenu_devicons() },
        right = { " ", wilder.popupmenu_scrollbar() },
        highlighter = { wilder.lua_fzy_highlighter() },
        pumblend = 0,
        max_height = "50%",
      })
    )
  end,
}
