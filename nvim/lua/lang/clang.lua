-- https://github.com/p00f/clangd_extensions.nvim

require("clangd_extensions").setup({
  server = {
    cmd = { "clangd" },
    filetypes = { "c", "cc", "cpp", "objc", "objcpp", "cuda", "proto" },
    single_file_support = true,
  },
  extensions = {
    autoSetHints = true,
    hover_with_actions = true,
    inlay_hints = {
      only_current_line_autocmd = "CursorMoved,CursorMovedI",
      show_parameter_hints = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "-> ",
      max_len_align_padding = 1,
      right_align_padding = 7,
      highlight = "InlayHints",
      priority = 100,
      only_current_line = false,
      max_len_align = false,
      right_align = false,
    },
    ast = {
      role_icons = {
        type = "🄣",
        declaration = "🄓",
        expression = "🄔",
        statement = ";",
        specifier = "🄢",
        ["template argument"] = "🆃",
      },
      kind_icons = {
        Compound = "🄲",
        Recovery = "🅁",
        TranslationUnit = "🅄",
        PackExpansion = "🄿",
        TemplateTypeParm = "🅃",
        TemplateTemplateParm = "🅃",
        TemplateParamObject = "🅃",
      },
      highlights = { detail = "InlayHints" },
    },
    memory_usage = { border = "single" },
    symbol_info = { border = "single" },
  },
})
