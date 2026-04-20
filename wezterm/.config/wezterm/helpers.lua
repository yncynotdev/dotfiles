-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

local module = {}

-- This will hold the configuration.

function module.apply_to_config(config)
  config.enable_tab_bar = false
  config.window_close_confirmation = "NeverPrompt"

  config.initial_cols = 120
  config.initial_rows = 28

  config.font = wezterm.font("JetBrains Mono")
  config.enable_kitty_graphics = true

  -- Options for window background
  config.window_background_opacity = 0.9
  config.kde_window_background_blur = true

  config.window_decorations = "RESIZE"

  -- Appearance
  function scheme_for_appearance(appearance)
    if appearance:find "Dark" then
      return "Catppuccin Mocha"
    else
      return "Catppuccin Latte"
    end
  end

  config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

  -- Window Frame
  config.window_frame = {
    border_left_width = "0.5cell",
    border_right_width = "0.5cell",
    border_bottom_height = "0.25cell",
    border_top_height = "0.25cell",
    border_left_color = "#a6e3a1",
    border_right_color = "#a6e3a1",
    border_bottom_color = "#a6e3a1",
    border_top_color = "#a6e3a1",
  }

  -- Key Tables
  config.leader = { key = "a", mods = "CTRL", timeout_ms = 1000 }
  config.keys = {
    {
      key = "m",
      mods = "LEADER",
      action = act.ToggleFullScreen,
    },
    {
      key = "n",
      mods = "LEADER",
      action = act.Hide,
    },
  }
end

return module
