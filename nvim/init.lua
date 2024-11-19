function P(x)
  print(vim.inspect(x))
end

local function bootstrap()
  -- Enable the module loader cache for faster Lua module loading.
  if vim.loader and not vim.loader.enabled then
    vim.loader.enable()
  end

  local utils = require("utils")
  local constants = require("constants")

  if
    not utils.check_required_executables_and_features(
      constants.REQUIRED_EXECUTABLES,
      constants.REQUIRED_FEATURES
    )
  then
    return
  end

  utils.create_dir(constants.SESSION_DIR)

  -- Configure built-in global variables.
  vim.g.netrw_banner = 0 -- disable the banner
  vim.g.netrw_browse_split = 0 -- re-use the same window
  vim.g.netrw_liststyle = 3 -- tree style listing
  vim.g.netrw_winsize = 50 -- percent

  require("options")
  require("keymaps")
  require("autocmds")

  utils.reset_highlights()

  -- utils.load_plugins()

  require("highlights")
end

bootstrap()
