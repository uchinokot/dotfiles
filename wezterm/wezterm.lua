-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
config.automatically_reload_config = true
config.font_size = 12.0
config.font = wezterm.font("MesloLGL Nerd Font", { weight = "Regular" })
config.use_ime = true
config.color_scheme = "nord"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.macos_forward_to_ime_modifier_mask = "SHIFT|CTRL"
config.window_decorations = "RESIZE"
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}
config.window_background_gradient = {
  colors = { "#1d2129" },
}

local keybind = require("keybinds")

-- キーバインドにコピーとペーストを追加
table.insert(keybind.keys, {
  key = "c", -- Ctrl+Cでクリップボードにコピー
  mods = "SUPER",
  action = wezterm.action.CopyTo("Clipboard"),
})

table.insert(keybind.keys, {
  key = "V", -- Ctrl+Shift+Vでクリップボードからペースト
  mods = "SUPER|SHIFT",
  action = wezterm.action.PasteFrom("Clipboard"),
})

config.keys = keybind.keys
config.key_tables = keybind.key_tables

config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 1000 }

return config
