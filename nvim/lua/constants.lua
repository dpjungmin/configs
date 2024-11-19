local constants = {
  REQUIRED_EXECUTABLES = { "git", "rg", "fd" },
  REQUIRED_FEATURES = { "nvim-0.10.0", "python3" },
  SESSION_DIR = vim.fn.stdpath("data") .. "/sessions",
}

-- Metatable to prevent modification.
return setmetatable(constants, {
  __newindex = function(_, key, value)
    error("attempt to modify constant: " .. key .. " = " .. tostring(value))
  end,
  __index = function(_, key)
    error("attempt to access undefined key: " .. key)
  end,
  __metatable = false,
})
