return {
  "mhinz/vim-startify",
  config = function()
    local g = vim.g
    g.startify_session_dir = g.session_dir
    g.ascii = { "작은 일에도 최선을" }
    g.startify_custom_header = "startify#pad(g:ascii)"
    g.startify_lists = {
      { header = { "   sessions" }, type = "sessions" },
      { header = { "   bookmarks" }, type = "bookmarks" },
      { header = { "   commands" }, type = "commands" },
    }
    g.startify_bookmarks = {}
    g.startify_commands = {}
  end,
}
