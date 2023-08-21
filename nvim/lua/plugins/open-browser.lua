return {
  "tyru/open-browser.vim",
  config = function()
    vim.cmd([[
        let g:netrw_nogx = 1
        nmap gx <Plug>(openbrowser-smart-search)
        vmap gx <Plug>(openbrowser-smart-search)
      ]])
  end,
}
