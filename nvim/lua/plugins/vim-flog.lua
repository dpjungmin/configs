-- https://github.com/rbong/vim-flog

return {
  "rbong/vim-flog",
  keys = {
    { "gl", "<cmd>Flog<cr>" },
  },
  dependencies = { "tpope/vim-fugitive" },
}
