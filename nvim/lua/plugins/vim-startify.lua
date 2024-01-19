-- https://github.com/mhinz/vim-startify

return {
  "mhinz/vim-startify",
  config = function()
    -- configs
    vim.g.startify_session_dir = vim.g.session_dir
    vim.g.ascii = { "작은 일에도 최선을" }
    vim.g.startify_custom_header = "startify#pad(g:ascii)"
    vim.g.startify_lists = {
      { header = { "   sessions" }, type = "sessions" },
      { header = { "   bookmarks" }, type = "bookmarks" },
      { header = { "   commands" }, type = "commands" },
    }
    vim.g.startify_bookmarks = {}
    vim.g.startify_commands = {}

    -- keymaps
    vim.keymap.set(
      "n",
      "\\ss",
      ":mks! " .. vim.g.session_dir .. "/",
      { noremap = true, desc = "save session" }
    )
    vim.keymap.set(
      "n",
      "\\os",
      ":so " .. vim.g.session_dir .. "/",
      { noremap = true, desc = "open session" }
    )
  end,
}
