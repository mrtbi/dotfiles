-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

--- Color Scheme and Font
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font ('JetBrainsMono Nerd Font', { weight = 'Bold' })
-- Sets the font for the window frame (tab bar)
config.window_frame = {
  font = wezterm.font({ family = 'JetBrainsMono Nerd Font', weight = 'Bold' })
}
config.font_size = 12.5

-- Window styling
config.background = {
  {
    source = {
      File = wezterm.config_dir .. "/img/bg-monterey.png",
    },
    hsb = {
      hue = 1.0,
      saturation = 1.02,
      brightness = 0.25,
    },
    width = "100%",
    height = "100%",
  },
  {
    source = {
      Color = "#282c35",
    },
    width = "100%",
    height = "100%",
    opacity = 0.55,
  },
}
---config.macos_window_background_blur = 30
config.window_decorations = 'RESIZE'
config.window_padding = { left = 3, right = 3, top = 0, bottom = 0 }

--- Defaults
config.automatically_reload_config = true
config.adjust_window_size_when_changing_font_size = false
config.default_cursor_style = 'BlinkingBar'
config.enable_tab_bar = false
config.send_composed_key_when_left_alt_is_pressed = true
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false

-- from: https://akos.ma/blog/adopting-wezterm/
config.hyperlink_rules = {
  -- Matches: a URL in parens: (URL)
  {
    regex = '\\((\\w+://\\S+)\\)',
    format = '$1',
    highlight = 1,
  },
  -- Matches: a URL in brackets: [URL]
  {
    regex = '\\[(\\w+://\\S+)\\]',
    format = '$1',
    highlight = 1,
  },
  -- Matches: a URL in curly braces: {URL}
  {
    regex = '\\{(\\w+://\\S+)\\}',
    format = '$1',
    highlight = 1,
  },
  -- Matches: a URL in angle brackets: <URL>
  {
    regex = '<(\\w+://\\S+)>',
    format = '$1',
    highlight = 1,
  },
  -- Then handle URLs not wrapped in brackets
  {
    -- Before
    --regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
    --format = '$0',
    -- After
    regex = '[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)',
    format = '$1',
    highlight = 1,
  },
  -- implicit mailto link
  {
    regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
    format = 'mailto:$0',
  },
}

-- Misc settings
config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'

-- Don't hide cursor when typing
config.hide_mouse_cursor_when_typing = false

-- Return the configuration to wezterm
return config
