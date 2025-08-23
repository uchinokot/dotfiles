local wezterm = require("wezterm")
local act = wezterm.action

return {
  keys = {
    { key = "[", mods = "CTRL", action = wezterm.action.PaneSelect },
    { key = "RightArrow", mods = "SUPER|ALT", action = act.ActivateTabRelative(1) },
    { key = "LeftArrow", mods = "SUPER|ALT", action = act.ActivateTabRelative(-1) },
    { key = "P", mods = "CMD|SHIFT", action = wezterm.action.ActivateCommandPalette },
    { key = "j", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Next" }) },
    { key = "k", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Prev" }) },
  },
}
