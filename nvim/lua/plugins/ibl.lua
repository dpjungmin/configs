-- https://github.com/lukas-reineke/indent-blankline.nvim

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  enabled = true,
  event = "VimEnter",
  config = function()
    vim.api.nvim_set_hl(0, "IBL", { fg = "#302d39" })

    require("ibl").setup({
      indent = { highlight = { "IBL" }, char = "│" }, -- '▏'
      whitespace = {
        highlight = { "IBL" },
        remove_blankline_trail = true,
      },
      scope = { enabled = false },
    })

    vim.keymap.set("n", "<leader>tI", "<cmd>IBLToggle<cr>", { desc = "toggle indent-blankline" })
  end,
}
