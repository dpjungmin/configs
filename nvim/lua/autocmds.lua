vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYankedText", { clear = true }),
  pattern = "*",
  desc = "highlight yanked text",
  callback = function()
    vim.highlight.on_yank({ higroup = "YankColor", timeout = 300, on_visual = true })
  end,
})

local group_id = vim.api.nvim_create_augroup("TermOpen", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  group = group_id,
  pattern = "*",
  desc = "remove line numbers",
  command = "setlocal norelativenumber nonumber",
})
vim.api.nvim_create_autocmd("TermOpen", {
  group = group_id,
  pattern = "*",
  desc = "start in insert mode",
  command = "startinsert",
})

local group_id = vim.api.nvim_create_augroup("DynamicSmartCaseInCmdLine", { clear = true })
vim.api.nvim_create_autocmd("CmdLineEnter", {
  group = group_id,
  pattern = ":",
  desc = "case sensitive",
  command = "set nosmartcase",
})
vim.api.nvim_create_autocmd("CmdLineLeave", {
  group = group_id,
  pattern = ":",
  desc = "smartcase",
  command = "set smartcase",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = vim.api.nvim_create_augroup("AutoReloadWhenFileChanged", { clear = true }),
  pattern = "*",
  desc = "notify that file has changed",
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded!", vim.log.levels.WARN)
  end,
})

local group_id = vim.api.nvim_create_augroup("ToggleLineNumbers", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  group = group_id,
  pattern = "*",
  desc = "set relative line numbers",
  command = "if &nu | set rnu | endif",
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  group = group_id,
  pattern = "*",
  desc = "set no relative line numbers",
  command = "if &nu | set rnu | endif",
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("ResumeLastCursorPosition", { clear = true }),
  pattern = "*",
  desc = "move cursor to last position",
  callback = function()
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
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("justfile", { clear = true }),
  pattern = "justfile",
  desc = "set filetype for justfile",
  command = "set filetype=make",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("astro", { clear = true }),
  pattern = "*.astro",
  desc = "set filetype for astro files",
  command = "set filetype=astro",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("netrw", { clear = true }),
  pattern = "netrw",
  desc = "remap only in netrw buffers",
  callback = function()
    vim.keymap.set(
      "n",
      "<tab>",
      "<plug>NetrwLocalBrowseCheck",
      { buffer = true, noremap = true, silent = true }
    )
  end,
})
