-- https://github.com/kevinhwang91/nvim-hlslens

return {
  "kevinhwang91/nvim-hlslens",
  keys = {
    {
      "n",
      "<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>",
      desc = "",
    },
    {
      "N",
      "<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require('hlslens').start()<cr>",
      desc = "",
    },
    { "*", "*<cmd>lua require('hlslens').start()<cr>", desc = "" },
    { "#", "#<cmd>lua require('hlslens').start()<cr>", desc = "" },
    { "g*", "g*<cmd>lua require('hlslens').start()<cr>", desc = "" },
    { "g#", "g#<cmd>lua require('hlslens').start()<cr>", desc = "" },
  },
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
  end,
}
