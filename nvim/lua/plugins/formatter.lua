-- https://github.com/mhartington/formatter.nvim

return {
  "mhartington/formatter.nvim",
  event = "VimEnter",
  config = function()
    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        lua = {
          function()
            local util = require("formatter.util")

            return {
              exe = "stylua",
              args = {
                "--search-parent-directories",
                "--stdin-filepath",
                util.escape_path(util.get_current_buffer_file_path()),
                "--",
                "-",
              },
              stdin = true,
            }
          end,
        },
        c = {
          function()
            return {
              exe = "clang-format",
              args = { "--style='{BasedOnStyle: LLVM}'" },
              stdin = true,
            }
          end,
        },
        cpp = {
          function()
            return {
              exe = "clang-format",
              args = { "--style='{BasedOnStyle: LLVM}'" },
              stdin = true,
            }
          end,
        },
        rust = {
          function()
            return {
              exe = "rustfmt",
              args = { "--edition=2021" },
              stdin = true,
            }
          end,
        },
        java = {
          function()
            return {
              exe = "google-java-format",
              args = { "-" },
              stdin = true,
            }
          end,
        },
        nix = {
          function()
            return {
              exe = "nixpkgs-fmt",
              args = {},
              stdin = true,
            }
          end,
        },
        python = { require("formatter.filetypes.python").black },
        markdown = { require("formatter.filetypes.markdown").prettier },
        javascript = { require("formatter.filetypes.javascript").prettier },
        javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
        typescript = { require("formatter.filetypes.typescript").prettier },
        typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
        css = { require("formatter.filetypes.css").prettier },
        html = { require("formatter.filetypes.html").prettier },
        astro = { require("formatter.filetypes.javascript").prettier },
        ["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
      },
    })

    vim.api.nvim_create_autocmd("BufWritePost", {
      group = vim.api.nvim_create_augroup("formatter", { clear = true }),
      pattern = "*",
      desc = "format on save",
      command = "FormatWrite",
    })
  end,
}
