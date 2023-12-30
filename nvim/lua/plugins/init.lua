return {
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  "windwp/nvim-ts-autotag",
  "hrsh7th/cmp-nvim-lsp",
  "simrat39/rust-tools.nvim",
  "p00f/clangd_extensions.nvim",
  "mfussenegger/nvim-dap",
  "romgrk/fzy-lua-native",
  "onsails/lspkind-nvim",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "mtoohey31/cmp-fish",
  "roxma/nvim-yarp",
  "roxma/vim-hug-neovim-rpc",
  "machakann/vim-swap",
  "machakann/vim-sandwich",
  "itchyny/vim-highlighturl",
  "tpope/vim-commentary",
  "jose-elias-alvarez/null-ls.nvim",
  "wuelnerdotexe/vim-astro",

  -- language enhancements
  { "Olical/aniseed", ft = { "fnl" } },
  { "cespare/vim-toml", ft = { "toml" } },
  { "stephpy/vim-yaml", ft = { "yaml" } },
  { "dag/vim-fish", ft = { "fish" } },
  { "LnL7/vim-nix", ft = { "nix" } },

  -- snippets
  {
    "SirVer/ultisnips",
    config = function()
      local g = vim.g
      g.UltiSnipsSnippetDirectories = { "UltiSnips", "snips" }
      g.UltiSnipsJumpForwardTrigger = "<tab>"
      g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
    end,
  },
  { "honza/vim-snippets", dependencies = { "SirVer/ultisnips" } },
  {
    "quangnguyen30192/cmp-nvim-ultisnips",
    dependencies = { "hrsh7th/nvim-cmp", "SirVer/ultisnips" },
  },
}
