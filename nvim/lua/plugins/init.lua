return {
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  "itchyny/vim-highlighturl",
  "tpope/vim-commentary", -- cs"'
  "tpope/vim-surround",

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
    end,
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      vim.opt.termguicolors = true
      require("colorizer").setup()
    end,
  },
  {
    "preservim/vim-markdown",
    ft = { "markdown" },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "tyru/open-browser.vim",
    config = function()
      vim.cmd([[
        let g:netrw_nogx = 1
        nmap gx <Plug>(openbrowser-smart-search)
        vmap gx <Plug>(openbrowser-smart-search)
      ]])
    end,
  },

  -- language enhancements
  "JoosepAlviste/nvim-ts-context-commentstring",
  { "Olical/aniseed", ft = { "fnl" } },
  { "cespare/vim-toml", ft = { "toml" } },
  { "stephpy/vim-yaml", ft = { "yaml" } },
  { "dag/vim-fish", ft = { "fish" } },
  { "LnL7/vim-nix", ft = { "nix" } },
  "wuelnerdotexe/vim-astro",

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
