local bufnr = vim.api.nvim_get_current_buf()

-- code actions
vim.keymap.set("n", "<leader>ca", function()
  vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
end, { silent = true, buffer = bufnr })

-- runnables
vim.keymap.set("n", "<leader>rr", function()
  vim.cmd.RustLsp({ "runnables" })
end, { silent = true, buffer = bufnr })

-- expand macros recursively
vim.keymap.set("n", "<leader>M", function()
  vim.cmd.RustLsp("expandMacro")
end, { silent = true, buffer = bufnr })

-- rebuild proc macros
vim.keymap.set("n", "<leader>rpm", function()
  vim.cmd.RustLsp("rebuildProcMacros")
end, { silent = true, buffer = bufnr })

-- hover actions
vim.keymap.set("n", "K", function()
  vim.cmd.RustLsp({ "hover", "actions" })
end, { silent = true, buffer = bufnr })

-- hover range
vim.keymap.set("n", "<leader>K", function()
  vim.cmd.RustLsp({ "hover", "range" })
end, { silent = true, buffer = bufnr })

-- explain errors
vim.keymap.set("n", "<leader>E", function()
  vim.cmd.RustLsp("explainError")
end, { silent = true, buffer = bufnr })

-- open Cargo.toml
vim.keymap.set("n", "<leader>oc", function()
  vim.cmd.RustLsp("openCargo")
end, { silent = true, buffer = bufnr })

-- view syntax tree
vim.keymap.set("n", "<leader>ts", function()
  vim.cmd.RustLsp("syntaxTree")
end, { silent = true, buffer = bufnr })
