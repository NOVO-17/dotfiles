-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config = { 

  automatically_reload_config = true,
  enable_tab_bar = false, 

  window_decorations = "NONE | RESIZE", 
  window_close_confirmation = "NeverPrompt", 
  default_prog = { "powershell.exe", "-NoLogo" }, 
  front_end = "Software", 

  default_cursor_style = "BlinkingBlock", 
  window_background_opacity = 0.8, 
  text_background_opacity = 1.0, 

  max_fps = 120, 
  animation_fps = 1, 
  cursor_blink_rate = 500, 
  term = "xterm-256color", 

  cell_width = 0.9, 
  initial_cols = 120, 
  initial_rows = 28,

  default_cwd = "E:/code", 
  font_size = 11, 

  window_padding = { 
    left = 0, 
    right = 0,
    top = 1,
    bottom = 0,
  },
}

config.keys = { 

  {
  -- toggling opacity 
  key = "]",
  mods = "CTRL|ALT",
  action = wezterm.action_callback(function(window, _)
      local overrides = window:get_config_overrides() or {}
      if overrides.window_background_opacity == 1.0 then
        overrides.window_background_opacity = 0.8 
      else
        overrides.window_background_opacity = 1.0
      end 
      window:set_config_overrides(overrides)
    end),
  },

  {
    -- kill active pane
    key = "w",
    mods = "CTRL",
    action = wezterm.action.CloseCurrentPane({ confirm = false })
  }, 

  {
    --split horizontal 
    key = "d",
    mods = "CTRL",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" })
  }, 

  {
    --split vertical 
    key = "s", 
    mods = "CTRL",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) 
  }, 

  {
    --toggle fullscreen 
    key = "f", 
    mods = "CTRL", 
    action = wezterm.action.ToggleFullScreen 
  },

  { 
    key = "j",
    mods = "CTRL",
    action = wezterm.action.ActivatePaneDirection("Next")
  },

  { 
    key = "k",
    mods = "CTRL",
    action = wezterm.action.ActivatePaneDirection("Prev")
  },

  {
    key = "o",
    mods = "CTRL",
    action = wezterm.action.TogglePaneZoomState
  },
}

-- Finally, return the configuration to wezterm:
return config
