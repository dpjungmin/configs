-- https://github.com/kevinhwang91/nvim-hlslens

return {
  "kevinhwang91/nvim-hlslens",
  config = function()
    require("hlslens").setup({
      override_lens = function(render, posList, nearest, idx, _)
        local lnum, col = unpack(posList[idx])
        local cnt = #posList
        local text = ("[%d/%d]"):format(idx, cnt)
        local chunks
        if nearest then
          chunks = { { " ", "Ignore" }, { text, "HlSearchLensNear" } }
        else
          chunks = { { " ", "Ignore" }, { text, "HlSearchLens" } }
        end
        render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
      end,
    })

    -- keymaps
    vim.keymap.set(
      "n",
      "n",
      "<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>"
    )
    vim.keymap.set(
      "n",
      "N",
      "<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require('hlslens').start()<cr>"
    )
    vim.keymap.set("n", "*", "*<cmd>lua require('hlslens').start()<cr>")
    vim.keymap.set("n", "#", "#<cmd>lua require('hlslens').start()<cr>")
    vim.keymap.set("n", "g*", "g*<cmd>lua require('hlslens').start()<cr>")
    vim.keymap.set("n", "g#", "g#<cmd>lua require('hlslens').start()<cr>")

    -- highlights
    vim.api.nvim_set_hl(0, "HlSearchNear", { link = "IncSearch" })
    vim.api.nvim_set_hl(0, "HlSearchLens", { fg = "#1e7c61" })
    vim.api.nvim_set_hl(0, "HlSearchLensNear", { fg = "#2efc71" })
  end,
}
