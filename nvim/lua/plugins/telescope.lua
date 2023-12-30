-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    -- stylua: ignore start
    { "\\R", "<cmd>Telescope resume<cr>", desc = "lists the results of the previous picker" },
    { "<leader>.", "<cmd>Telescope find_files<cr>", desc = "list files in current directory" },
    { "<leader>,", "<cmd>Telescope buffers<cr>", desc = "list open buffers" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "lists most recently opened files" },
    { "<leader>g", "<cmd>Telescope grep_string<cr>", desc = "searches for the string under the cursor" },
    { "<leader>G", "<cmd>Telescope live_grep<cr>", desc = "search for a string" },
    { "<leader>fgs", "<cmd>Telescope git_status<cr>", desc = "lists current changes per file with diff preview and add action" },
    { "<leader>fgb", "<cmd>Telescope git_branches<cr>", desc = "lists all branches with log preview" },
    { "<leader>fgl", "<cmd>Telescope git_bcommits<cr>", desc = "lists buffer's git commits with diff preview" },
    { "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "lists man page entries" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "lists available help tags" },
    { "<leader>fH", "<cmd>Telescope highlights<cr>", desc = "lists available highlights" },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "lists Diagnostics for all open buffers or a specific buffer" },
    { "<leader>K", "<cmd>Telescope lsp_references<cr>", desc = "lists LSP references for the work under the cursor" },
    { "<leader>i", "<cmd>Telescope lsp_implementations<cr>", desc = "lists implementations of the work under the cursor" },
    -- stylua: ignore end
    {
      "<leader>rgyaml",
      "<cmd>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,-tyaml<cr>",
    },
    {
      "<leader>rgmd",
      "<cmd>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,-tmarkdown<cr>",
    },
    {
      "<leader>rgpy",
      "<cmd>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,-tpy<cr>",
    },
    {
      "<leader>rgrs",
      "<cmd>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,-trust<cr>",
    },
    {
      "<leader>rgh",
      "<cmd>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,-th<cr>",
    },
    {
      "<leader>rgcc",
      "<cmd>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,--type-add=cc:*.cc,-tcc<cr>",
    },
    {
      "<leader>rghcc",
      "<cmd>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,--type-add=cc:h,--type-add=cc:*.cc,-tcc<cr>",
    },
    {
      "<leader>rgut",
      "<cmd>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,--type-add=ut:*_ut.cc,-tut<cr>",
    },
    {
      "<leader>fn",
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
        diagnostics = {
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
