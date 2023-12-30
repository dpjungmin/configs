-- https://github.com/norcalli/nvim-colorizer.lua

return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    vim.opt.termguicolors = true
    require("colorizer").setup()
  end,
}
