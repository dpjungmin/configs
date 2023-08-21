-- https://github.com/gelguy/wilder.nvim

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
        highlighter = { wilder.lua_fzy_highlighter() },
        highlights = { accent = "MatchAccent" },
        left = { " ", wilder.popupmenu_devicons() },
        right = { " ", wilder.popupmenu_scrollbar() },
        pumblend = 10,
        max_height = "50%",
      })
    )
  end,
}
