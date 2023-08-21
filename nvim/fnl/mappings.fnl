(import-macros {: set! : map!} :macros)

; Leader key
(set vim.g.mapleader "\\")

; Plugin
(map! [n] :<space>ti :<cmd>IlluminateToggle<cr> {:desc "Globally toggle the pause/resume for vim-illuminate"})
(map! [n] :<space>n "<cmd>lua require('illuminate').goto_next_reference(true)<cr>" {:desc "Move the cursor to the closest reference after the cursor"})
(map! [n] :<space>N "<cmd>lua require('illuminate').goto_prev_reference(true)<cr>" {:desc "Move the cursor to the closest reference before the cursor"})

; High frequency
(map! [n] :<leader><leader>r
      "<cmd>silent update $MYVIMRC <bar> source $MYVIMRC <bar> call v:lua.vim.notify('Neovim configuration successfully reloaded!', 'info', { 'render': 'default', 'title': 'Neovim' })<cr>"
      {:desc "Update and reload $MYVIMRC"})
(map! [n] :<BS> "d0i<BS><space>" {:desc "Turn the word under the cursor into upper case"})
(map! [n] :<space>R :qq {:desc "Start recording commands in register `q`" :silent false})
(map! [n] "," "@q" {:desc "Replay register `q`" :silent false})
(map! [n] :<m-h> "^" {:desc "Go to the start of the line"})
(map! [n] :<m-l> :g_ {:desc "Go to the end of the line"})
(map! [n] :<tab> :<cmd>bn<cr> {:desc "Go to the next buffer"})
(map! [n] :<s-tab> :<cmd>bp<cr> {:desc "Go to the previous buffer"})
(map! [n] :<leader>ss (.. ":mks! " vim.g.sessiondir "/") {:desc "Make session" :silent false})
(map! [n] :<leader>so (.. ":so " vim.g.sessiondir "/") {:desc "Open session" :silent false})
(map! [n] :<leader>w :<cmd>update<cr> {:desc "Write only when the buffer has been modified"})
(map! [n] :<leader>q :<cmd>x<cr> {:desc "Write only when changes have been made and quit"})
(map! [n] :<leader>Q :<cmd>xa<cr> {:desc "Write all changed buffers and exit"})
(map! [n] :<leader><leader>q :<cmd>qa!<cr> {:desc "Force close all buffers and exit"})
(map! [n] :<leader>y "<cmd>%y<cr>" {:desc "Copy the entire buffer"})
(map! [n] :<leader><leader>y "<cmd>w !wl-copy<cr>" {:desc "Copy the entire buffer (Wayland)"})
(map! [n] :<space>d :<cmd>bd<cr> {:desc "Delete current buffer"})
(map! [n] :<space>D :<cmd>close<cr> {:desc "Close current window"})
(map! [n] :<space><space> :a<space><esc>h {:desc "Insert a space after the current character"})

; Low frequency
(map! [n] "q;" "q:" {:desc "Open the command-line window"})
(map! [n] :J "mzJ`z" {:desc "Do not move the cursor when joining lines"})
(map! [n] :<leader>cD "<cmd>lcd %:p:h<cr><cmd>pwd<cr>" {:desc "Change current working directory locally and print cwd"})
(map! [n] :<leader><leader>x "<cmd>update<cr><cmd>source %<cr>" {:desc "Source current file"})
(map! [n] :<space>ao (fn [] (string.format "m`%so<esc>``" vim.v.count1)) {:desc "Add a blank line below the current line" :expr true})
(map! [n] :<space>aO (fn [] (string.format "m`%sO<esc>``" vim.v.count1)) {:desc "Add a blank line above the current line" :expr true})
(map! [n] :<space>ov "<cmd>vs %<cr><c-w>h" {:desc "Open current file in a vertical split"})

; Togglers
(map! [n] :<space>tc
  (fn []
    (let [o vim.opt]
      (if (next (o.cc:get))
          (set! cc "")
          (set! cc :100))))
  {:desc "Toggle colorcolumn"})
(map! [n] :<space>tC
  (fn []
    (let [o vim.opt]
      (if (o.cursorline:get)
          (set! cursorline false)
          (set! cursorline))))
  {:desc "Toggle cursorline"})
(map! [n] :<space>tn
  (fn []
    (let [o vim.opt]
      (if (o.number:get)
          (do
            (set! number false)
            (set! relativenumber false))
          (do
            (set! number)
            (set! relativenumber)))))
  {:desc "Toggle number"})
(map! [n] :<space>ts
  (fn []
    (let [o vim.opt]
      (if (= 3 (o.laststatus:get))
          (set! laststatus 0)
          (set! laststatus 3))))
  {:desc "Toggle status-line"})

; Window navigation
(map! [n] :<left> :<c-w>h {:desc "Move left (window)"})
(map! [n] :<down> :<c-w>j {:desc "Move down (window)"})
(map! [n] :<up> :<c-w>k {:desc "Move up (window)"})
(map! [n] :<right> :<c-w>l {:desc "Move right (window)"})

(map! [n] :<c-h> :<c-w>h {:desc "Move left (window)"})
(map! [n] :<c-j> :<c-w>j {:desc "Move down (window)"})
(map! [n] :<c-k> :<c-w>k {:desc "Move up (window)"})
(map! [n] :<c-l> :<c-w>l {:desc "Move right (window)"})

; Window resize
(map! [n] :<s-up> "<cmd>resize +2<cr>" {:desc "Increase window height"})
(map! [n] :<s-down> "<cmd>resize -2<cr>" {:desc "Decrease window height"})
(map! [n] :<s-left> "<cmd>vertical resize +2<cr>" {:desc "Increase window width"})
(map! [n] :<s-right> "<cmd>vertical resize -2<cr>" {:desc "Decrease window width"})

; Continuous visual shifting
(map! [vx] "<" :<gv {:desc "Shift right"})
(map! [vx] ">" :>gv {:desc "Shift left"})

; Move text up/down
(map! [x] :<c-j> ":move '>+1<cr>gv-gv" {:desc "Move text down"})
(map! [x] :<c-k> ":move '<-2<cr>gv-gv" {:desc "Move text up"})

; Misc
(map! [i] :<c-u> :<esc>viwUea {:desc "Turn the word under the cursor into upper case"})
(map! [v] :p "\"_dP") ; hold on to the value that is being pasted

(each [_ ch (ipairs ["," "." "?" ";" ":" "!"])]
  (map! [i] ch (.. ch :<c-g>u) {:desc (.. "Break " ch " into smaller undo units")}))
