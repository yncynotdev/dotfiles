-- This setup is only used it you want to put wezterm configurations inside ~/.config dir
-- If you don't want to use the ~/.config dir, just copy and paste all the configurations
-- inside of init.lua -> wezterm.lua

-- Requires "helpers" folder from /wezterm/helpers.lua
local helpers = require 'helpers'

-- @param object{}
-- @use helpers.apply_to_config(object)
local config = {}
helpers.apply_to_config(config)

-- @return object
return config
