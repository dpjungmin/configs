-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<space>.", "<cmd>Telescope find_files<cr>", desc = "List files in current directory" },
    { "<space>,", "<cmd>Telescope buffers<cr>", desc = "List open buffers" },
    { "<space>fr", "<cmd>Telescope oldfiles<cr>", desc = "Lists most recently opened files" },
    {
      "<space>g",
      "<cmd>Telescope grep_string<cr>",
      desc = "Searches for the string under your cursor in your current working directory",
    },
    {
      "<space>G",
      "<cmd>Telescope live_grep<cr>",
      desc = "Search for a string in your current directory",
    },
    {
      "<space>rgyaml",
      "<cmd>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,-tyaml<cr>",
    },
    {
      "<space>rgmd",
      "<cmd>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,-tmarkdown<cr>",
    },
    {
      "<space>rgpy",
      "<cmd>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,-tpy<cr>",
    },
    {
      "<space>rgrs",
      "<cmd>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,-trust<cr>",
    },
    {
      "<space>rgcc",
      "<cmd>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,--type-add=cc:h,--type-add=cc:*.cc,-tcc<cr>",
    },
    {
      "<space>rgut",
      "<cmd>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,--type-add=ut:*_ut.cc,-tut<cr>",
    },
    {
      "<space>fgs",
      "<cmd>Telescope git_status<cr>",
      desc = "Lists current changes per file with diff preview and add action",
    },
    {
      "<space>fgb",
      "<cmd>Telescope git_branches<cr>",
      desc = "Lists all branches with log preview",
    },
    {
      "<space>fgl",
      "<cmd>Telescope git_bcommits<cr>",
      desc = "Lists buffer's git commits with diff preview",
    },
    { "<space>fm", "<cmd>Telescope man_pages<cr>", desc = "Lists man page entries" },
    { "<space>fh", "<cmd>Telescope help_tags<cr>", desc = "Lists available help tags" },
    { "<space>fH", "<cmd>Telescope highlights<cr>", desc = "Lists available highlights" },
    {
      "<space>K",
      "<cmd>Telescope lsp_references<cr>",
      desc = "Lists LSP references for the work under the cursor",
    },
    {
      "<space>i",
      "<cmd>Telescope lsp_implementations<cr>",
      desc = "Lists implementations of the work under the cursor",
    },
    {
      "<space>fn",
      function()
        require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
          layout_config = { prompt_position = "top", height = 0.35 },
          layout_strategy = "bottom_pane",
          prompt_prefix = " [nvim config files] ",
          prompt_title = "",
          cwd = "~/.config/nvim",
        }))
      end,
      desc = "List Neovim config files",
    },
  },
  config = function()
    return require("telescope").setup({
      defaults = {
        sorting_strategy = "ascending",
        selection_strategy = "reset",
        scroll_strategy = "cycle",
        winblend = 0,
        wrap_results = false,
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        border = true,
        path_display = { truncate = 3 },
        results_title = "",
        preview = {
          check_mime_type = false,
          filesize_limit = 25, -- MB
          timeout = 500, -- ms
          hide_on_startup = true,
        },
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
            ["<tab>"] = require("telescope.actions").move_selection_next,
            ["<s-tab>"] = require("telescope.actions").move_selection_previous,
            ["<c-j>"] = require("telescope.actions").move_selection_next,
            ["<c-k>"] = require("telescope.actions").move_selection_previous,
            ["<c-p>"] = require("telescope.actions.layout").toggle_preview,
          },
        },
      },
      pickers = {
        find_files = {
          layout_config = { prompt_position = "top", height = 0.35 },
          layout_strategy = "bottom_pane",
          prompt_prefix = " [files] ",
          prompt_title = "",
          preview_title = "",
        },
        buffers = {
          layout_config = { prompt_position = "top", height = 0.35 },
          layout_strategy = "bottom_pane",
          prompt_prefix = " [buffers] ",
          prompt_title = "",
          preview_title = "",
        },
        oldfiles = {
          layout_config = { prompt_position = "top", height = 0.35 },
          layout_strategy = "bottom_pane",
          prompt_prefix = " [~files] ",
          prompt_title = "",
          preview_title = "",
        },
        live_grep = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (rg) ",
          prompt_title = "",
          preview_title = "",
        },
        grep_string = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (rg %) ",
          prompt_title = "",
          preview_title = "",
        },
        man_pages = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " [man pages] ",
          prompt_title = "",
          preview_title = "",
        },
        help_tags = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " [help tags] ",
          prompt_title = "",
          preview_title = "",
        },
        highlights = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " [highlights] ",
          prompt_title = "",
          preview_title = "",
        },
        lsp_references = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (refs) ",
          prompt_title = "",
          preview_title = "",
        },
        lsp_implementations = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (impls) ",
          prompt_title = "",
          preview_title = "",
        },
        git_status = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.9,
            height = 0.9,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (git status) ",
          prompt_title = "",
          preview_title = "",
        },
        git_branches = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.9,
            height = 0.9,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (git branches) ",
          prompt_title = "",
          preview_title = "",
        },
        git_bcommits = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.9,
            height = 0.9,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (git commits for current buffer) ",
          prompt_title = "",
          preview_title = "",
        },
      },
      extensions = {},
    })
  end,
}
