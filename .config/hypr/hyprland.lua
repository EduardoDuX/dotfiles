-- ==========================================
-- Hyprland Main Configuration (~/.config/hypr/hyprland.lua)
-- ==========================================

-- Get the directory containing this hyprland.lua file
local config_dir = debug.getinfo(1, "S").source:sub(2):match("(.*[/\\])") or "./"
local modules_dir = config_dir .. "config_files/"

-- Load modules in order
dofile(modules_dir .. "variables.lua")
dofile(modules_dir .. "env.lua")
dofile(modules_dir .. "autostart.lua")
dofile(modules_dir .. "monitors.lua")
dofile(modules_dir .. "look_and_feel.lua")
dofile(modules_dir .. "input.lua")
dofile(modules_dir .. "keybinds.lua")
dofile(modules_dir .. "window_rules.lua")
