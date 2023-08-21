(import-macros {: set!} :macros)

; Turn on filetype 'detection', 'plugin', and 'indent' (see `:h filetype-overview`)
(vim.cmd "filetype plugin indent on")

; A list of file patterns that should be ignored when expanding wildcards
(set! wildignorecase)
(set! wildignore [:*.o :*.obj :*.dylib :*.bin :*.dll :*.exe])
(set! wildignore+ [:*/.git/* :*/.svn/* :*/__pycache__/* :*/build/**])
(set! wildignore+ [:*.jpg :*.png :*.jpef :*.bmp :*.gif :*.tiff :*.svg :*.ico])
(set! wildignore+ [:*.pyc :*.pkl :*.DS_Store :*.aux :*.bbl :*.brf :*.fls :*.fdb_latexmk :*.synctex.gz :*.xdv])

; Set backup directory
(vim.cmd "let &backupdir=g:backupdir\nlet &backupskip=&wildignore")
(set! backup)
(set! backupcopy :yes)

; General tab settings
(set! tabstop 4)
(set! softtabstop 4)
(set! shiftwidth 4)
(set! expandtab)

; Mouse settings
(set! mouse :a)
(set! mousemodel :popup)

; Popup menu settings
(set! pumheight 10)
(set! pumblend 10)
(set! winblend 0)

; Specify how keyword completion works
(set! complete+ [:kspell])
(set! complete- [:w :b :u :t])

; Option settings for diff mode
(set! diffopt+ [:vertical :filler :closeoff "context:3" :internal])
(set! diffopt+ [:indent-heuristic "algorithm:histogram"])

; Other settings
(set! clipboard+ [:unnamedplus])
(set! matchpairs+ ["<:>" "「:」" "『:』" "【:】" "“:”" "‘:’" "《:》"])
(set! number false)
(set! relativenumber false)
(set! guicursor "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20")
(set! linebreak)
(set! showbreak "↪")
(set! splitbelow)
(set! splitright)
(set! confirm)
(set! list)
(set! listchars {:nbsp "¬" :extends "»" :precedes "«" :trail "•" :tab ".."})
(set! scrolloff 5)
(set! swapfile false)
(set! autowrite)
(set! virtualedit :block)
(set! tildeop)
(set! startofline false)
(set! synmaxcol 200)
(set! spelllang [:en :cjk])
(set! undofile)
(set! showmode false)
(set! title)
(set! ignorecase)
(set! smartcase)
(set! showcmd)
(set! lazyredraw)
(set! showmatch)
(set! wrap false)
(set! autoindent)
(set! smartindent)
(set! foldmethod :manual)
(set! foldlevel 0)
(set! conceallevel 1)
(set! foldenable)
(set! signcolumn "auto:2")
(set! colorcolumn "")
(set! textwidth 100)
(set! shiftround)
(set! hidden)
(set! signcolumn :yes)
(set! cursorline false)
(set! laststatus 0)
(set! cmdheight 0)
