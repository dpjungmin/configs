function P(x)
  print(vim.inspect(x))
end

local function check()
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
end

local function load_plugins()
  local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  if not vim.loop.fs_stat(lazy_path) then
    vim.notify("downloading `lazy.nvim`...")
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazy_path,
    })
  end

  vim.opt.runtimepath:prepend({ lazy_path })

  require("lazy").setup("plugins", {
    root = vim.fn.stdpath("data") .. "/lazy",
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
    ui = {
      border = "single",
    },
  })

  vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { silent = true })
end

local function main()
  check()

  if vim.loader then
    vim.loader.enable()
  end

  vim.g.session_dir = vim.fn.stdpath("data") .. "/sessions"
  vim.fn.mkdir(vim.g.session_dir, "p")

  require("options")
  require("keymaps")
  require("autocmds")
  load_plugins()
  require("highlights")
end

main()
