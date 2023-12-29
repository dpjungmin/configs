local required_features = { "nvim-0.9.0", "python3" }
local required_executables = { "git", "rg", "fd" }

for _, feature in ipairs(required_features) do
  if vim.fn.has(feature) ~= 1 then
    vim.notify("feature " .. feature .. " is required, but is missing!")
    vim.cmd("finish")
  end
end

for _, expr in ipairs(required_executables) do
  if vim.fn.executable(expr) ~= 1 then
    vim.notify("executable " .. expr .. " is required, but is missing!")
    vim.cmd("finish")
  end
end

function P(x)
  print(vim.inspect(x))
end

require("base")
require("auto_commands")
require("mappings")

-- Load configuration written in Fennel.
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

-- Load plugins.
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

load_fnl()
load_plugins()

-- Load colorscheme.
require("colors").load("park")
