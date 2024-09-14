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
      -- mappings = {
      --   ["<c-u>"] = { "scroll", { "-vim.wo.scroll", "true", "20", "'cubic'" } },
      --   ["<c-d>"] = { "scroll", { "vim.wo.scroll", "true", "20", "'cubic'" } },
      --   ["<s-b>"] = { "scroll", { "-vim.wo.scroll", "true", "250", "'cubic'" } },
      --   ["<s-f>"] = { "scroll", { "vim.wo.scroll", "true", "250", "'cubic'" } },
      --   ["<s-y>"] = { "scroll", { "-0.10", "false", "100", nil } },
      --   ["<s-e>"] = { "scroll", { "0.10", "false", "100", nil } },
      --   ["zt"] = { "zt", { "10" } },
      --   ["zz"] = { "zz", { "10" } },
      --   ["zb"] = { "zb", { "10" } },
      -- },
    })

    local neoscroll = require("neoscroll")
    local keymap = {
      ["<C-u>"] = function()
        neoscroll.ctrl_u({ duration = 250 })
      end,
      ["<C-d>"] = function()
        neoscroll.ctrl_d({ duration = 250 })
      end,
      ["<s-b>"] = function()
        neoscroll.ctrl_b({ duration = 450 })
      end,
      ["<s-f>"] = function()
        neoscroll.ctrl_f({ duration = 450 })
      end,
      ["<s-y>"] = function()
        neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
      end,
      ["<s-e>"] = function()
        neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
      end,
      ["zt"] = function()
        neoscroll.zt({ half_win_duration = 250 })
      end,
      ["zz"] = function()
        neoscroll.zz({ half_win_duration = 250 })
      end,
      ["zb"] = function()
        neoscroll.zb({ half_win_duration = 250 })
      end,
    }
    local modes = { "n", "v", "x" }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}
