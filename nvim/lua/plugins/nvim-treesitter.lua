-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufEnter",
  build = ":TSUpdate",
  dependencies = { "windwp/nvim-ts-autotag" },
  config = function()
    local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitter"
    vim.fn.mkdir(parser_install_dir, "p")
    vim.opt.runtimepath:append(parser_install_dir)

    require("nvim-treesitter.configs").setup({
      parser_install_dir = parser_install_dir,
      ensure_installed = "all",
      ignore_install = { "erlang" },
      highlight = {
        enable = true,
        disable = { "c", "cc", "cpp" },
        additional_vim_regex_highlighting = false,
      },
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "tsx",
          "jsx",
        },
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
        persist_queries = false,
      },
      sync_install = false,
    })
  end,
}
