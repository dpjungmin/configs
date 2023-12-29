vim.g.__resume_last_cursor_position = function()
  vim.cmd([[
    let ok = v:true

    if line("'\"") > 1 && line("'\"") <= line('$') && &ft !~# 'commit'
      let args = v:argv  " command line arguments

      for arg in args
        if match(arg, '\v^\+(\d){1,}$') != -1
          ok = false
          break
        endif
      endfor

      if ok
        execute "normal! g`\"zvzz"
      endif
    endif
  ]])
end

local auto_commands = {
  -- highlight yanked text
  {
    {
      "TextYankPost",
      "*",
      "silent!",
      -- `YankColor` highlight group must be defined!
      "lua vim.highlight.on_yank { higroup = 'YankColor', timeout = 300, on_visual = true }",
    },
  },
  -- when opening a terminal
  {
    { "TermOpen", "*", "setlocal norelativenumber nonumber" },
    { "TermOpen", "*", "startinsert" },
  },
  -- dynamic smartcase
  {
    { "CmdLineEnter", ":", "set nosmartcase" },
    { "CmdLineLeave", ":", "set smartcase" },
  },
  -- accurate syntax highlighting
  {
    { "BufEnter", "*", ":syntax sync fromstart" },
  },
  -- auto reload when file changed
  {
    {
      "FileChangedShellPost",
      "*",
      "vim.notify('File changed on disk. Buffer reloaded!', vim.log.levels.WARN)",
    },
    { "FocusGained,CursorHold", "*", "if getcmdwintype() == '' | checktime | endif" },
  },
  -- toggle line number settings on insert mode
  {
    { "BufEnter,FocusGained,InsertLeave,WinEnter", "*", "if &nu | set rnu | endif" },
    { "BufLeave,FocusLost,InsertEnter,WinLeave", "*", "if &nu | set nornu | endif" },
  },
  -- resume from last cursor position
  {
    -- `__resume_last_cursor_position` must be defined in `vim.g`
    { "BufReadPost", "*", "lua vim.g.__resume_last_cursor_position()" },
  },
  -- format on save
  {
    { "BufWritePost", "*", "FormatWrite" },
  },
  -- set filetype for astro files
  {
    { "BufRead,BufEnter", "*.astro", "set filetype=astro" },
  },
  -- set filetype for justfile
  {
    { "BufRead,BufEnter", "justfile", "set filetype=make" },
  },
}

for i, args in ipairs(auto_commands) do
  local name = "_" .. i
  vim.cmd("augroup " .. name)
  vim.cmd("autocmd!")

  for _, arg in ipairs(args) do
    arg = table.concat(vim.tbl_flatten({ "autocmd", arg }), " ")
    vim.cmd(arg)
  end

  vim.cmd("augroup END")
end
