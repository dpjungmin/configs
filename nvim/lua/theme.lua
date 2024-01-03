local function hl(name, x)
  if x.link then
    vim.cmd("highlight! link " .. name .. " " .. x.link)
    return
  end

  local val = {
    fg = "None",
    bg = "None",
  }

  if x.fg then
    val.fg = x.fg
  end

  if x.bg then
    val.bg = x.bg
  end

  if x.sp then
    val.sp = x.sp
  end

  if x.style and not (x.style == "NONE") then
    if type(x.style) == "string" then
      val[x.style] = true
    end

    if type(x.style) == "table" then
      for _, s in ipairs(x.style) do
        val[s] = true
      end
    end
  end

  vim.api.nvim_set_hl(0, name, val)
end

-- reset all highlights to the defaults
vim.cmd("highlight clear")

-- get default colors back
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "dpark"
vim.opt.termguicolors = true

-- custom highlights
hl("YankColor", { fg = "#2b2539", bg = "#2ecc71" })
hl("InlayHints", { fg = "#b0c4de" })
hl("MatchAccent", { fg = "#30dff3", style = { "bold" } })

-- syntax
hl("Comment", { fg = "#4a90e2" })
hl("Constant", { fg = "#dcbdfb", style = { "bold" } })
hl("Character", { fg = "#ff938a" })
hl("String", { fg = "#e9967a" })
hl("Number", { fg = "#c38a61" })
hl("Float", { link = "Number" }) -- 5.3, 9e+10
hl("Identifier", { fg = "#cad8d2" })
hl("Function", { fg = "#ff8c00" })
hl("Statement", { fg = "#8fbc8f" })
hl("Keyword", { fg = "#9ac361", style = { "bold" } })
hl("Conditional", { fg = "#ba55d3", style = { "bold" } }) -- if-else, switch
hl("Repeat", { link = "Conditional" }) -- for, do-while
hl("Label", { link = "Conditional" }) -- case, default
hl("Statement", { fg = "#8fbc8f" })
hl("Operator", { fg = "#e0f0ef" }) -- +, -, *, /
hl("Exception", { fg = "#30dff3" })
hl("Include", { fg = "#add8e6" })
hl("PreProc", { fg = "#cad8d2" })
hl("Define", { fg = "#8ac361" })
hl("Macro", { fg = "#f0c239" })
hl("PreCondit", { fg = "#f0c239" })
hl("Type", { fg = "#f0c239", style = { "bold" } })
hl("StorageClass", { fg = "#cd5c5c" })
hl("Structure", { fg = "#ff6347" })
hl("Special", { fg = "#8ac361" })
hl("SpecialChar", { fg = "#ffffff" })
hl("Tag", { fg = "#98c379" })
hl("SpecialComment", { fg = "#9da8a3" })
hl("Debug", { fg = "#cad8d2" })
hl("Delimiter", { fg = "#ecf6f2" })
hl("Todo", { fg = "#ff0000", style = { "bold" } })
hl("Error", { fg = "#e5534b", style = { "undercurl" } })
hl("Underlined", { style = "underline" })
hl("Bold", { style = "bold" })
hl("Italic", { style = "italic" })

-- editor
hl("Normal", { fg = "#ffffff", bg = "#2b2539" })
hl("NormalNC", { link = "Normal" })
hl("Cursor", { bg = "#00ff00" })
hl("Cursor2", { bg = "#ff0000" })
hl("lCursor", { link = "Cursor" })
hl("CursorIM", { link = "Cursor" })
hl("TermCursor", { link = "Cursor" })
hl("TermCursorNC", { bg = "#ff8c00" })
hl("LineNr", { fg = "#adbac7" })
hl("LineNrAbove", { fg = "#636e7b" })
hl("LineNrBelow", { fg = "#636e7b" })
hl("CursorLine", { bg = "#373e47" })
hl("CursorLineNr", { fg = "#adbac7", style = { "bold" } })
hl("CursorColumn", { link = "CursorLine" })
hl("ColorColumn", { bg = "#2d302f" })
hl("Conceal", { link = "Normal" })
hl("SignColumn", {})
hl("SignColumnSB", { link = "SignColumn" })
hl("VertSplit", { fg = "#333c56" })
hl("Title", { fg = "#6cb6ff", style = { "bold" } })
hl("Visual", { bg = "#263e47" })
hl("VisualNOS", { link = "Visual" })
hl("Search", { bg = "#515c6a" })
hl("IncSearch", { bg = "#515c6a", style = { "bold" } })
hl("CurSearch", { link = "IncSearch" })
hl("EndOfBuffer", { fg = "#161719" }) -- `~` at the end of bufferr
hl("Whitespace", { fg = "#434846" })
hl("NonText", { fg = "#434846" })
hl("SpecialKey", { link = "NonText" })
hl("MatchParen", { bg = "#434846" })
hl("Folded", { bg = "#342e42" })
hl("FoldColumn", { fg = "#ffffff" })
hl("DiffAdd", { bg = "#245829" })
hl("DiffChange", { bg = "#c93c37" })
hl("DiffDelete", { bg = "#922323" })
hl("DiffText", { bg = "#347d39" })
hl("diffAdded", { link = "DiffAdd" })
hl("diffChanged", { link = "DiffChange" })
hl("diffRemoved", { link = "DiffDelete" })
hl("diffOldFile", { fg = "#c2442d" })
hl("diffNewFile", { fg = "#347d39" })
hl("diffFile", { fg = "#316dca" })
hl("NormalFloat", { fg = "#ecf6f2" })
hl("FloatBorder", { fg = "#505b92" })
hl("Directory", { fg = "#6cb6ff" })
hl("ModeMsg", { fg = "#505b92" })
hl("MoreMsg", { fg = "#568064" })
hl("Question", { fg = "#316dca" })
hl("QuickFixLine", { link = "Visual" })
hl("Float", { fg = "#6bc46d" })
hl("ErrorMsg", { fg = "#e5534b" })
hl("WarningMsg", { fg = "#c69026" })
hl("Pmenu", { fg = "#ecf6f2", bg = "#434846" })
hl("PmenuSel", { fg = "#ecf6f2", bg = "#404b82" })
hl("PmenuSbar", { bg = "#5a605d" })
hl("PmenuThumb", { bg = "#ecf6f2" })
hl("WildMenu", { link = "Pmenu" })

-- plugins

-- https://github.com/hrsh7th/nvim-cmp
hl("CmpItemMenu", { link = "Comment" })
hl("CmpItemAbbrDeprecated", { fg = "#808080", style = { "strikethrough" } })
hl("CmpItemAbbrMatch", { fg = "#30dff3", style = { "bold" } })
hl("CmpItemAbbrMatchFuzzy", { fg = "#30dff3", style = { "bold" } })
hl("CmpItemKindVariable", { fg = "#6cb6ff" })
hl("CmpItemKindInterface", { link = "CmpItemKindVariable" })
hl("CmpItemKindText", { link = "CmpItemKindVariable" })
hl("CmpItemKindFunction", { fg = "#b0a4e3" })
hl("CmpItemKindMethod", { link = "CmpItemKindFunction" })
hl("CmpItemKindKeyword", { fg = "#e0f0ef" })
hl("CmpItemKindUnit", { link = "CmpItemKindKeyword" })

-- https://github.com/nvim-telescope/telescope.nvim
hl("TelescopeBorder", { fg = "#6e6a86" })
hl("TelescopeSelectionCaret", { fg = "#30dff3" })
hl("TelescopeSelection", { bg = "#393552" })
hl("TelescopeMultiSelection", { link = "TelescopeSelection" })
hl("TelescopeMatching", { link = "MatchAccent" })
hl("TelescopePromptPrefix", { fg = "#eb6f92", style = { "bold" } })
hl("TelescopePromptNormal", { link = "TelescopePromptPrefix" })

-- https://github.com/lewis6991/gitsigns.nvim
hl("GitSignsCurrentLineBlame", { fg = "#545d68" })
hl("GitSignsAdd", { fg = "#46954a" })
hl("GitSignsAddInline", { fg = "#ffffff", bg = "#46954a" })
hl("GitSignsAddLnInline", { link = "GitSignsAddInline" })
hl("GitSignsAddLnVirtLnInline", { link = "GitSignsAddInline" })
hl("GitSignsChange", { fg = "#ae7c14" })
hl("GitSignsChangeInline", { fg = "#ffffff", bg = "#ae7c14" })
hl("GitSignsChangeLnInline", { link = "GitSignsChangeInline" })
hl("GitSignsChangeLnVirtLnInline", { link = "GitSignsChangeInline" })
hl("GitSignsDelete", { fg = "#e5534b" })
hl("GitSignsDeleteInline", { fg = "#ffffff", bg = "#e5534b" })
hl("GitSignsDeleteLnInline", { link = "GitSignsDeleteInline" })
hl("GitSignsDeleteLnVirtLnInline", { link = "GitSignsDeleteInline" })

-- https://github.com/lukas-reineke/indent-blankline.nvim
hl("IndentBlanklineChar", { fg = "#393552" })

-- https://github.com/kyazdani42/nvim-tree.lua
hl("NvimTreeGitNew", { fg = "#46954a" })
hl("NvimTreeGitRenamed", { fg = "#ae7c14" })
hl("NvimTreeGitDeleted", { fg = "#e5534b" })
hl("NvimTreeRootFolder", { fg = "#ffffff" })
hl("NvimTreeSpecialFile", { fg = "#ffffff" })

-- https://github.com/nvim-treesitter/nvim-treesitter-context
hl("TreesitterContext", { bg = "#263e47", style = { "bold" } })

-- https://github.com/folke/which-key.nvim
hl("WhichKeyBorder", { fg = "#aaaaaa" })

-- https://github.com/RRethy/vim-illuminate
hl("IlluminatedWordText", { bg = "#373e47" })
hl("IlluminatedWordRead", { bg = "#373e47" })
hl("IlluminatedWordWrite", { bg = "#373e47" })

-- https://github.com/kevinhwang91/nvim-hlslens
hl("HlSearchNear", { link = "IncSearch" })
hl("HlSearchLens", { fg = "#228b22" })
hl("HlSearchLensNear", { fg = "#00ff00" })

-- https://github.com/kevinhwang91/nvim-ufo
hl("UfoFoldedFg", { link = "Normal" })
hl("UfoFoldedBg", { link = "Folded" })
hl("UfoPreviewSbar", { link = "PmenuSbar" })
hl("UfoPreviewThumb", { link = "PmenuThumb" })
hl("UfoPreviewWinBar", {})
hl("UfoPreviewCursorLine", { link = "CursorLine" })
hl("UfoFoldedEllipsis", { fg = "#342e42" })
hl("UfoCursorFoldedLine", { link = "CursorLine" })
