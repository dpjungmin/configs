local constants = require("constants")
local map = require("utils").set_keymap

map("n", "<leader>?", "<cmd>Inspect<cr>")
map("n", "<leader>d", "<cmd>bdelete<cr>") -- delete current buffer
map("n", "<leader>c", "<cmd>close<cr>") -- close current window
map("n", "<leader>ov", "<cmd>vsplit %<cr><c-w>h") -- close current window
map("n", "<leader>]", "g<c-]>") -- ctags
map("n", "<leader><leader>", "a<space><esc>h") -- insert a space in front of the cursor
map("n", "\\w", "<cmd>update<cr>") -- write on change (current buffer)
map("n", "\\q", "<cmd>x<cr>") -- write on change and quit (current buffer)
map("n", "\\Q", "<cmd>xall<cr>") -- write on change and quit (all buffers)
map("n", "\\y", "<cmd>%y<cr>") -- copy the entire buffer
map("n", "\\\\x", "<cmd>update<cr><cmd>source %<cr>") -- source current file
map("n", "\\\\q", "<cmd>qall!<cr>") -- force close all buffers and exit
map("n", "<m-h>", "^") -- go to start of the line
map("n", "<m-l>", "g_") -- go to end of the line
map("n", "<bs>", "d0i<BS><space>")
map("n", "<tab>", "<cmd>bnext<cr>") -- go to the next buffer
map("n", "<s-tab>", "<cmd>bprevious<cr>") -- go to the previous buffer
map("n", "q;", "q:") -- open the command-line window
map("n", "<c-a>", "gg<s-v>G") -- select all
map("n", "<m-j>", "<cmd>cnext<cr>")
map("n", "<m-k>", "<cmd>cprev<cr>")

-- wildmenu
map("c", "<tab>", "pumvisible() ? '<c-n>' : '<c-r>=getcmdline()<cr>'", { expr = true })
map("c", "<s-tab>", "pumvisible() ? '<c-p>' : '<left>'", { expr = true })

-- session management
map("n", "\\ss", ":mks! " .. constants.SESSION_DIR .. "/") -- save session
map("n", "\\so", ":source " .. constants.SESSION_DIR .. "/") -- open session

-- netrw
map("n", "<leader>s", "<cmd>Explore<cr>") -- explore directory of current file
map("n", "<leader>S", "<cmd>Sexplore<cr>") -- split and explore current file's directory
map("n", "<leader>v", "<cmd>Vexplore<cr>") -- vertical split and explore
map("n", "<leader>r", "<cmd>Rexplore<cr>") -- vertical split and explore

-- window navigation
map("n", "<left>", "<c-w>h")
map("n", "<down>", "<c-w>j")
map("n", "<up>", "<c-w>k")
map("n", "<right>", "<c-w>l")
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

-- window resize
map("n", "<s-up>", "<cmd>resize +2<cr>")
map("n", "<s-down>", "<cmd>resize -2<cr>")
map("n", "<s-left>", "<cmd>vertical resize +2<cr>")
map("n", "<s-right>", "<cmd>vertical resize -2<cr>")

-- move text up/down
map("x", "<c-j>", ":move '>+1<cr>gv-gv")
map("x", "<c-k>", ":move '<-2<cr>gv-gv")

-- continuous visual shifting
map({ "v", "x" }, "<", "<gv")
map({ "v", "x" }, ">", ">gv")

map("v", "p", '"_dP') -- hold on to the value that is being pasted

-- break these characters into smaller undo units
for _, ch in pairs({ ",", ".", "?", ";", ":", "!" }) do
  map("i", ch, ch .. "<c-g>u")
end

-- toggle number
map("n", "<leader>tn", function()
  if vim.opt.number:get() then
    vim.opt.number = false
    vim.opt.relativenumber = false
  else
    vim.opt.number = true
    vim.opt.relativenumber = true
  end
end)
-- toggle statusline
map("n", "<leader>ts", function()
  if vim.opt.laststatus:get() == 1 then
    vim.opt.laststatus = 2
  else
    vim.opt.laststatus = 1
  end
end)
-- toggle cursorline
map("n", "<leader>tc", function()
  if vim.opt.cursorline:get() then
    vim.opt.cursorline = false
  else
    vim.opt.cursorline = true
  end
end)
-- toggle colorcolumn
map("n", "<leader>tC", function()
  if next(vim.opt.cc:get()) then
    vim.opt.colorcolumn = ""
  else
    vim.opt.colorcolumn = "100"
  end
end)
-- open built-in terminal at the bottom
map("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
end)
map("t", "<esc>", "<c-\\><c-n>") -- leave terminal-mode
