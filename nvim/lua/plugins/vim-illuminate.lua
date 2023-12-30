-- https://github.com/RRethy/vim-illuminate

return {
  "RRethy/vim-illuminate",
  keys = {
    { "<leader>ti", "<cmd>IlluminateToggle<cr>", { desc = "toggle vim-illuminate" } },
    { "<leader>n", "<cmd>lua require('illuminate').goto_next_reference(true)<cr>" },
    { "<leader>N", "<cmd>lua require('illuminate').goto_prev_reference(true)<cr>" },
  },
  config = function()
    vim.cmd("IlluminatePause")
  end,
}
