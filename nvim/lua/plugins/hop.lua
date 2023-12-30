-- https://github.com/phaazon/hop.nvim

return {
  "phaazon/hop.nvim",
  branch = "v2",
  event = "VimEnter",
  keys = {
    {
      "J",
      function()
        require("hop").hint_char2()
      end,
      desc = "hop to the occurrence of a bigram",
    },
  },
  config = function()
    vim.defer_fn(function()
      require("hop").setup({
        quit_key = "<esc>",
        case_insensitive = true,
        char2_fallback_key = "<cr>",
      })
    end, 2000)
  end,
}
