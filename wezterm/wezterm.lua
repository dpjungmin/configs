require("event_handlers")

local base_config = require("base_config")
local config = require("colors").paint(base_config)

config.leader = { key = "b", mods = "META", timeout_milliseconds = 2000 }
config.keys = require("key_bindings")
config.key_tables = require("key_tables")
config.mouse_bindings = require("mouse_bindings")

return config
