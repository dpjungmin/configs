local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.keymap.set(mode, lhs, rhs, options)
end

vim.api.nvim_set_var("mapleader", " ")

map("n", "<leader>?", "<cmd>Inspect<cr>")
map("n", "<bs>", "d0i<BS><space>")
map("n", "\\ss", ":mks! " .. vim.g.session_dir .. "/", { silent = false }) -- save session
map("n", "\\os", ":so " .. vim.g.session_dir .. "/", { silent = false }) -- open session
