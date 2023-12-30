function P(x)
  print(vim.inspect(x))
end

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

local function load_plugins()
  require("lazy").setup("plugins", {
    root = vim.fn.stdpath("data") .. "/lazy",
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
    ui = {
      border = "single",
    },
  })
end

require("base")
require("mappings")
require("auto_commands")
load_plugins()
require("theme")
