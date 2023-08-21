-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/onsails/lspkind.nvim
-- https://github.com/Saecki/crates.nvim#nvim-cmp-source
-- https://github.com/mtoohey31/cmp-fish

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind-nvim",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "mtoohey31/cmp-fish",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<tab>"] = function(fallback)
          if cmp.visible() then
            return cmp.select_next_item()
          else
            return fallback()
          end
        end,
        ["<s-tab>"] = function(fallback)
          if cmp.visible() then
            return cmp.select_prev_item()
          else
            return fallback()
          end
        end,
        ["<cr>"] = cmp.mapping.confirm({ select = true }),
        ["<c-e>"] = cmp.mapping.abort(),
        ["<esc>"] = cmp.mapping.close(),
        ["<d-d>"] = cmp.mapping.scroll_docs(-4),
        ["<d-f>"] = cmp.mapping.scroll_docs(4),
      }),
      snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body)
        end,
      },
      completion = {
        keyword_length = 1,
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          preset = "default",
          symbol_map = {
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "ﰠ",
            Variable = "",
            Class = "ﴯ",
            Interface = "",
            Module = "",
            Property = "ﰠ",
            Unit = "塞",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "פּ",
            Event = "",
            Operator = "",
            TypeParameter = "",
          },
          menu = {
            nvim_lsp = "[lsp]",
            nvim_lua = "[lua]",
            ultisnips = "[us]",
            path = "[path]",
            buffer = "[buffer]",
            emoji = "[emoji]",
          },
        }),
      },
      matching = {
        disallow_fuzzy_matching = false,
        disallow_partial_matching = false,
        disallow_prefix_unmatching = false,
      },
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.recently_used,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "ultisnips" },
        { name = "path" },
        { name = "buffer", keyword_length = 4 },
        { name = "crates" },
        { name = "fish" },
      }),
      windows = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      experimental = {
        ghost_text = true,
      },
    })
  end,
}
