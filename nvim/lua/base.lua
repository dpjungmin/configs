-- Load `lazy` and `hotpot`.
local function load_initial_dependencies()
  local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  if not vim.loop.fs_stat(lazy_path) then
    vim.notify("downloading `lazy.nvim`...")
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazy_path,
    })
  end

  vim.opt.runtimepath:prepend({ lazy_path })
end

load_initial_dependencies()

-- global editor variables
vim.g.vimsyn_embed = "lP"
vim.g.is_mac = vim.fn.has("macunix")
vim.g.is_linux = vim.fn.has("unix") and not vim.fn.has("macunix")
vim.g.session_dir = vim.fn.stdpath("data") .. "/sessions"

vim.fn.mkdir(vim.g.session_dir, "p")
vim.cmd("filetype plugin indent on") -- see ``:h filetype-overview``

-- options
vim.opt.wildignorecase = true
vim.opt.wildignore = { "*.o", "*.obj", "*.dylib", "*.bin" }
vim.opt.wildignore:append({ "*/.git/*", "*/__pycache__/*", "*/build/**", "*/node_modules/*" })
vim.opt.wildignore:append({ "*.jpg", "*.png", "*.jpef", "*.gif", "*.tiff", "*.svg", "*.ico" })
vim.opt.wildignore:append({ "*.DS_Store" })

vim.opt.tags = { "./tags", "./.tags", ".git/tags", ".git/.tags" } -- ctags

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.mouse = "a"
vim.opt.mousemodel = "popup"

vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0

vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.cursorline = false

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
vim.opt.foldmethod = "manual"
vim.opt.foldlevel = 0
vim.opt.conceallevel = 1
vim.opt.foldenable = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = ""
vim.opt.textwidth = 100
vim.opt.shiftround = true
vim.opt.hidden = true
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 0
vim.opt.cmdheight = 0
