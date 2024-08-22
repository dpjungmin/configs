local function reset_highlights()
  -- reset all highlights to the defaults
  vim.cmd("highlight clear")

  -- get default colors back
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
end

vim.g.colors_name = "dpjungmin"

-- • {name}   Highlight group name, e.g. "ErrorMsg"
-- • {val}    Highlight definition map, accepts the following keys:
--             • fg (or foreground): color name or "#RRGGBB", see note.
--             • bg (or background): color name or "#RRGGBB", see note.
--             • sp (or special): color name or "#RRGGBB"
--             • blend: integer between 0 and 100
--             • bold: boolean
--             • standout: boolean
--             • underline: boolean
--             • undercurl: boolean
--             • underdouble: boolean
--             • underdotted: boolean
--             • underdashed: boolean
--             • strikethrough: boolean
--             • italic: boolean
--             • reverse: boolean
--             • nocombine: boolean
--             • link: name of another highlight group to link to, see
--               |:hi-link|.
--             • default: Don't override existing definition |:hi-default|
--             • ctermfg: Sets foreground of cterm color |ctermfg|
--             • ctermbg: Sets background of cterm color |ctermbg|
--             • cterm: cterm attribute map, like |highlight-args|. If not
--               set, cterm attributes will match those from the attribute
--               map documented above.
local function hl(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

-- custom highlights
hl("YankColor", { fg = "#2b2539", bg = "#2ecc71" })
hl("InlayHints", { fg = "#2ecc71" })
hl("MatchAccent", { fg = "#ff5555", bold = true })
hl("MatchAccentSel", { fg = "#ff5555", bg = "#404b82", bold = true })

-- syntax
hl("Comment", { fg = "#4a90e2" })
hl("Constant", { fg = "#dcbdfb", bold = true })
hl("Character", { fg = "#ff938a" })
hl("String", { fg = "#e9967a" })
hl("Number", { fg = "#c38a61" })
hl("Float", { link = "Number" }) -- 5.3, 9e+10
hl("Identifier", { fg = "#cad8d2" })
hl("Function", { fg = "#ff8c00" })
hl("Statement", { fg = "#8fbc8f" })
hl("Keyword", { fg = "#9ac361", bold = true })
hl("Conditional", { fg = "#ba55d3", bold = true }) -- if-else, switch
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
hl("Type", { fg = "#f0c239", bold = true })
hl("StorageClass", { fg = "#cd5c5c" })
hl("Structure", { fg = "#ff6347" })
hl("Special", { fg = "#8ac361" })
hl("SpecialChar", { fg = "#ffffff" })
hl("Tag", { fg = "#98c379" })
hl("SpecialComment", { fg = "#9da8a3" })
hl("Debug", { fg = "#cad8d2" })
hl("Delimiter", { fg = "#ecf6f2" })
hl("Todo", { fg = "#ff0000", bold = true })
hl("Error", { fg = "#e5534b", undercurl = true })
hl("Underlined", { underline = true })
hl("Bold", { bold = true })
hl("Italic", { italic = true })

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
hl("CursorLineNr", { fg = "#adbac7", bold = true })
hl("CursorColumn", { link = "CursorLine" })
hl("ColorColumn", { bg = "#2d302f" })
hl("Conceal", { link = "Normal" })
hl("SignColumn", {})
hl("SignColumnSB", { link = "SignColumn" })
hl("VertSplit", { fg = "#333c56" })
hl("Title", { fg = "#6cb6ff", bold = true })
hl("Visual", { bg = "#263e47" })
hl("VisualNOS", { link = "Visual" })
hl("Search", { bg = "#515c6a" })
hl("IncSearch", { bg = "#515c6a", bold = true })
hl("CurSearch", { link = "IncSearch" })
hl("EndOfBuffer", { fg = "#161719" }) -- `~` at the end of the buffer
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
hl("Directory", { fg = "#6cb6ff" })
hl("ModeMsg", { fg = "#505b92" })
hl("MoreMsg", { fg = "#568064" })
hl("Question", { fg = "#316dca" })
hl("QuickFixLine", { link = "Visual" })
hl("Float", { fg = "#6bc46d" })
hl("ErrorMsg", { fg = "#e5534b" })
hl("WarningMsg", { fg = "#c69026" })

-- pop-up menu
hl("Pmenu", { fg = "#C5CDD9", bg = "#3b3539" })
hl("PmenuSel", { fg = "NONE", bg = "#404b82" })
hl("PmenuSbar", { bg = "#5a605d" })
hl("PmenuThumb", { bg = "#ecf6f2" })
hl("WildMenu", { link = "Pmenu" })
hl("NormalFloat", { fg = "#ecf6f2" })
hl("FloatBorder", { fg = "#505b92" })

-- spelling
hl("SpellBad", { sp = "NvimLightRed", undercurl = true }) -- For badly spelled words.
hl("SpellCap", { sp = "NvimLightYellow", undercurl = true }) -- For words that start with a capital letter that shouldn’t.
hl("SpellRare", { sp = "NvimLightCyan", undercurl = true }) -- For rare or technical words.
hl("SpellLocal", { sp = "NvimLightGreen", undercurl = true }) -- For words that are recognized by a local dictionary but not the main one.
