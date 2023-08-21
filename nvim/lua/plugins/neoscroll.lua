-- https://github.com/karb94/neoscroll.nvim

return {
  "karb94/neoscroll.nvim",
  event = "VimEnter",
  config = function()
    require("neoscroll").setup({
      hide_cursor = true,
      stop_eof = true,
      cursor_scrolls_alone = true,
      easing_function = "quadratic",
      pre_hook = nil,
      post_hook = nil,
      use_local_scrolloff = false,
      respect_scrolloff = false,
      performance_mode = false,
    })

    require("neoscroll.config").set_mappings({
      ["<c-u>"] = { "scroll", { "-vim.wo.scroll", "true", "20", "'cubic'" } },
      ["<c-d>"] = { "scroll", { "vim.wo.scroll", "true", "20", "'cubic'" } },
      ["<s-b>"] = { "scroll", { "-vim.wo.scroll", "true", "250", "'cubic'" } },
      ["<s-f>"] = { "scroll", { "vim.wo.scroll", "true", "250", "'cubic'" } },
      ["<s-y>"] = { "scroll", { "-0.10", "false", "100", nil } },
      ["<s-e>"] = { "scroll", { "0.10", "false", "100", nil } },
      ["zt"] = { "zt", { "10" } },
      ["zz"] = { "zz", { "10" } },
      ["zb"] = { "zb", { "10" } },
    })
  end,
}
