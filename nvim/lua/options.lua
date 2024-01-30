vim.opt.wildignorecase = true
vim.opt.wildignore = { "*.o", "*.obj", "*.dylib", "*.bin" }
vim.opt.wildignore:append({ "*/.git/*", "*/__pycache__/*", "*/build/**", "*/node_modules/*" })
vim.opt.wildignore:append({ "*.jpg", "*.png", "*.jpef", "*.gif", "*.tiff", "*.svg", "*.ico" })
vim.opt.wildignore:append({ "*.DS_Store" })

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 0
vim.opt.foldenable = true

vim.opt.undodir = "~/.vimdid"
vim.opt.undofile = true

vim.opt.tags = { "tags", ".tags", ".git/tags", ".git/.tags" } -- ctags
vim.opt.spell = true
vim.opt.mouse = "a"
vim.opt.mousemodel = "popup"
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.cursorline = false
vim.opt.termguicolors = true
vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.matchpairs:append({ "<:>", "“:”", "‘:’" })
vim.opt.linebreak = true
vim.opt.showbreak = "↪"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.confirm = true
vim.opt.list = true
vim.opt.listchars = { nbsp = "¬", extends = "»", precedes = "«", trail = "•", tab = ".." }
vim.opt.scrolloff = 5
vim.opt.swapfile = false
vim.opt.autowrite = true
vim.opt.virtualedit = "block"
vim.opt.tildeop = true
vim.opt.startofline = false
vim.opt.synmaxcol = 200
vim.opt.spelllang = { "en", "cjk" }
vim.opt.undofile = true
vim.opt.showmode = false
vim.opt.title = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showcmd = true
vim.opt.lazyredraw = true
vim.opt.showmatch = true
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = ""
vim.opt.textwidth = 100
vim.opt.shiftround = true
vim.opt.hidden = true
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 1
vim.opt.cmdheight = 0
vim.opt.gdefault = true
