return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  ft = { "c", "cpp", "lua", "rust", "go", "python" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
    "neovim/nvim-lspconfig",
  },
  keys = {
    { "gic", "<cmd>Lspsaga incoming_calls<cr>", desc = "peek incoming calls" },
    { "goc", "<cmd>Lspsaga outgoing_calls<cr>", desc = "peek outgoing calls" },
    { "gd", "<cmd>Lspsaga peek_definition<cr>", desc = "peek definition" },
    { "gtd", "<cmd>Lspsaga peek_type_definition<cr>", desc = "peek type definition" },
    { "<leader>f", "<cmd>Lspsaga finder<cr>", desc = "peek type definition" },
    { "<leader>k", "<cmd>Lspsaga hover_doc ++keep<cr>", desc = "pin the hover window" },
    { "<leader>rn", "<cmd>Lspsaga rename<cr>", desc = "rename (language symbol)" },
    { "<leader>rN", "<cmd>Lspsaga rename ++project<cr>", desc = "rename (project level)" },
  },
  config = function()
    require("lspsaga").setup({
      symbol_in_winbar = {
        enable = false,
        separator = " › ",
        hide_keyword = true,
        show_file = false,
        folder_level = 1,
        color_mode = false,
        delay = 300, -- ms
      },
      callhierarchy = {
        layout = "normal",
        keys = {
          edit = "e",
          vsplit = "v",
          split = "s",
          quit = "q",
          shuttle = "[w",
          toggle_or_req = "<tab>",
          close = "<C-c>k",
        },
      },
      definition = {
        width = 0.6,
        height = 0.5,
        keys = {
          edit = "e",
          vsplit = "v",
          split = "s",
          quit = "q",
          close = "<C-c>k",
        },
      },
      finder = {
        max_height = 0.5,
        left_width = 0.3,
        right_width = 0.3,
        methods = {
          tyd = "textDocument/typeDefinition",
        },
        default = "tyd+ref+imp+def",
        layout = "normal",
        filter = {},
        silent = false,
        keys = {
          shuttle = "[w",
          toggle_or_open = "<tab>",
          vsplit = "v",
          split = "s",
          quit = "q",
          close = "<C-c>k",
        },
      },
      hover = {
        max_width = 0.9,
        max_height = 0.8,
        open_link = "gx",
      },
      implement = {
        enable = false,
        sign = false,
        virtual_text = true,
        priority = 100,
      },
      lightbulb = {
        enable = true,
        sign = true,
        virtual_text = false,
        debounce = 10,
        sign_priority = 40,
      },
      rename = {
        in_select = true,
        auto_save = false,
        project_max_width = 0.5,
        project_max_height = 0.5,
        keys = {
          quit = "q",
          exec = "<cr>",
          select = "x",
        },
      },
      ui = {
        border = "single",
        devicon = false,
        title = false,
        expand = "⊞",
        collapse = "⊟",
        code_action = "!",
        actionfix = " ",
        lines = { "┗", "┣", "┃", "━", "┏" },
        kind = {},
        imp_sign = "󰳛 ",
      },
    })
  end,
}
