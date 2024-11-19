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

return M
