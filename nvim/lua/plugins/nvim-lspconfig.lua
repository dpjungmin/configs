return {
  "neovim/nvim-lspconfig",
  lazy = false,
  priority = 1000,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "simrat39/rust-tools.nvim",
    "p00f/clangd_extensions.nvim",
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
    "hrsh7th/nvim-cmp",
  },
  keys = {
    {
      "<space>B",
      "<cmd>DapToggleBreakpoint<cr>",
      desc = "Creates or removes a breakpoint at the current line",
    },
    { "<leader><leader>S", "<cmd>LspStart<cr>", desc = "Start LSP client" },
    { "<leader><leader>s", "<cmd>LspStop<cr>", desc = "Stop LSP client" },
    {
      "<space>q",
      function()
        vim.diagnostic.setqflist({ open = true })
      end,
      desc = "Add all diagnostics to the quickfix list",
    },
    { "<space>e", vim.diagnostic.open_float, desc = "Show diagnostics in a floating window" },
    {
      "[d",
      vim.diagnostic.goto_prev,
      desc = "Move to the previous diagnostic in the current buffer",
    },
    {
      "]d",
      vim.diagnostic.goto_next,
      desc = "Move to the next diagnostic in the current buffer",
    },
  },
  config = function()
    require("lang")
  end,
}
