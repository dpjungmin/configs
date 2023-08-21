local function init()
  local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  if not vim.loop.fs_stat(lazy_path) then
    vim.notify("Downloading `lazy.nvim`...", vim.log.levels.WARN)
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazy_path,
    })
  end

  local hotpot_path = vim.fn.stdpath("data") .. "/lazy/hotpot.nvim"

  if not vim.loop.fs_stat(hotpot_path) then
    vim.notify("Downloading `hotpot.nvim`...", vim.log.levels.INFO)
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--single-branch",
      "--branch=v0.9.1",
      "https://github.com/rktjmp/hotpot.nvim.git",
      hotpot_path,
    })
  end

  vim.opt.runtimepath:prepend({ lazy_path, hotpot_path })
end

local function load_fnl()
  require("hotpot").setup({
    provide_require_fennel = true,
    enable_hotpot_diagnostics = true,
    compiler = {
      modules = {
        correlate = true,
      },
      macros = {
        env = "_COMPILER",
        compilerEnv = _G,
        allowGlobals = false,
      },
    },
  })

  require("fnl_main")
end

local function load_plugins()
  local plugins = require("plugins")

  require("lazy").setup(plugins, {
    root = vim.fn.stdpath("data") .. "/lazy",
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
    ui = {
      border = "single",
    },
  })
end

local function start()
  load_fnl()
  load_plugins()
  require("colors").load("park")
end

local function main()
  init()
  start()
end

main()
