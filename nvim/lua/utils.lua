local M = {}

-- Check if a executable exists in PATH.
local function executable_exists(executable)
  return vim.fn.executable(executable) == 1
end

-- Check if a neovim feature exists.
local function feature_exists(feature)
  return vim.fn.has(feature) == 1
end

function M.check_required_executables_and_features(required_executables, required_features)
  local missing_executables = {}
  local missing_features = {}

  for _, executable in ipairs(required_executables) do
    if not executable_exists(executable) then
      table.insert(missing_executables, executable)
    end
  end

  for _, feature in ipairs(required_features) do
    if not feature_exists(feature) then
      table.insert(missing_features, feature)
    end
  end

  if #missing_executables > 0 then
    print("missing executables: " .. table.concat(missing_executables, ", "))
  end

  if #missing_features > 0 then
    print("missing features: " .. table.concat(missing_features, ", "))
  end

  return #missing_executables == 0 or #missing_features == 0
end

function M.create_dir(path)
  local ok, err = pcall(vim.fn.mkdir, path, "p")

  if not ok then
    print("failed to create directory: " .. err)
  end

  return ok
end

function M.load_plugins()
  local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  if not (vim.uv or vim.loop).fs_stat(lazy_path) then
    local out = vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazy_path,
    })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end

  vim.opt.runtimepath:prepend({ lazy_path })

  require("lazy").setup({
    spec = {
      { import = "plugins" },
    },
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
    ui = {
      border = "single",
    },
  })

  vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { silent = true })
  vim.api.nvim_set_hl(0, "LazyBackdrop", { fg = "#2b2539" })
end

function M.set_keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.keymap.set(mode, lhs, rhs, options)
end

function M.reset_highlights()
  -- Reset all highlights to their defaults.
  vim.cmd("highlight clear")

  -- Set default colors back.
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
end

function M.set_highlight(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

return M
