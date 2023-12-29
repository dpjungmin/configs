return {
  "kyazdani42/nvim-tree.lua",
  tag = "nightly",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  keys = {
    { "<space>s", "<cmd>NvimTreeToggle<cr>", desc = "Toggle nvim-tree" },
    {
      "<space>S",
      "<cmd>NvimTreeFindFileToggle<cr>",
      desc = "Toggle nvim-tree (focus on the current file)",
    },
    {
      "<space><leader>",
      "<cmd>NvimTreeFindFileToggle " .. vim.g.session_dir .. "<cr>",
      desc = "Toggle nvim-tree (open nvim session directory)",
    },
    { "<leader>r", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse nvim-tree" },
  },
  config = function()
    require("nvim-tree").setup({
      auto_reload_on_write = true,
      hijack_netrw = true,
      sort_by = "name",
      view = {
        adaptive_size = true,
        width = "35%",
        side = "right",
        preserve_window_proportions = true,
        signcolumn = "yes",
        float = {
          enable = false,
          quit_on_focus_loss = true,
          open_win_config = {
            relative = "editor",
            border = "single",
            width = 10000,
            height = 10000,
            row = 5,
            col = 10000,
          },
        },
        hide_root_folder = false,
        number = false,
        relativenumber = false,
      },
      renderer = {
        highlight_opened_files = "none",
        indent_markers = {
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            none = "  ",
          },
          enable = false,
        },
        icons = {
          webdev_colors = true,
        },
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        special_files = {
          "Cargo.toml",
          "Makefile",
          "README.md",
          "LICENSE",
        },
        symlink_destination = true,
      },
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      update_focused_file = {
        ignore_list = {},
        enable = false,
        update_cwd = false,
      },
      ignore_ft_on_setup = {},
      system_open = {
        cmd = "",
        args = {},
      },
      diagnostics = {
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
        enable = false,
        show_on_dirs = false,
      },
      filters = {
        custom = {},
        exclude = {},
        dotfiles = false,
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 400,
      },
      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
        open_file = {
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
          quit_on_open = false,
          resize_window = false,
        },
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
      log = {
        types = {
          all = false,
          config = false,
          copy_paste = false,
          diagnostics = false,
          git = false,
          profile = false,
        },
        enable = false,
        truncate = false,
      },
      create_in_closed_folder = false,
      disable_netrw = false,
      hijack_cursor = false,
      hijack_unnamed_buffer_when_opening = false,
      ignore_buffer_on_setup = false,
      open_on_setup = false,
      open_on_setup_file = false,
      open_on_tab = false,
      update_cwd = false,
    })
  end,
}
