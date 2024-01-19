-- https://github.com/akinsho/toggleterm.nvim

return {
  "akinsho/toggleterm.nvim",
  event = "VimEnter",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 25
        elseif term.direction == "vertical" then
          return (vim.o.columns * 0.4)
        end
      end,
      open_mapping = "<c-\\>",
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = false,
      persist_mode = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
      float_opts = { border = "single", winblend = 0 },
      winbar = {
        enabled = false,
        name_formatter = function(term)
          return term.name
        end,
      },
    })
  end,
}
