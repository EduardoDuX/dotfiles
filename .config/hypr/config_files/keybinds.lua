-- config_files/keybinds.lua

local main_mod = "SUPER"

-- Define fallback app strings if not imported globally
local terminal = terminal or "kitty"
local file_manager = file_manager or "nemo"
local menu = menu or "rofi -show drun"
local browser = browser or "firefox"

-- Applications & System Actions
hl.bind(main_mod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(main_mod .. " + W", hl.dsp.window.close())
hl.bind(main_mod .. " + M", hl.dsp.exit())
hl.bind(main_mod .. " + E", hl.dsp.exec_cmd(file_manager))
hl.bind(main_mod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(main_mod .. " + F", hl.dsp.exec_cmd(browser))
hl.bind(main_mod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(main_mod .. " + D", hl.dsp.exec_cmd("discord"))
hl.bind(main_mod .. " + P", hl.dsp.exec_cmd("code"))
hl.bind(main_mod .. " + V", hl.dsp.exec_cmd("kitty --class clipse -e clipse"))
hl.bind(main_mod .. " + B", hl.dsp.exec_cmd("killall -SIGUSR1 waybar || waybar &"))

-- Resize windows
hl.bind(main_mod .. " + SHIFT + RIGHT", hl.dsp.window.resize({ x = 100, y = 0 }))
hl.bind(main_mod .. " + SHIFT + LEFT", hl.dsp.window.resize({ x = -100, y = 0 }))
hl.bind(main_mod .. " + SHIFT + UP", hl.dsp.window.resize({ x = 0, y = -100 }))
hl.bind(main_mod .. " + SHIFT + DOWN", hl.dsp.window.resize({ x = 0, y = 100 }))

-- Focus movement (wrapped in functions so they evaluate on keypress)
hl.bind(main_mod .. " + LEFT", function() hl.dispatch("movefocus", "l") end)
hl.bind(main_mod .. " + RIGHT", function() hl.dispatch("movefocus", "r") end)
hl.bind(main_mod .. " + UP", function() hl.dispatch("movefocus", "u") end)
hl.bind(main_mod .. " + DOWN", function() hl.dispatch("movefocus", "d") end)

-- Switch Workspaces 1-9
for i = 1, 9 do
    hl.bind(main_mod .. " + " .. i, hl.dsp.focus({ workspace = tostring(i) }))
    hl.bind(main_mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i) }))
end

-- Workspace 10 & Previous
hl.bind(main_mod .. " + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind(main_mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))
hl.bind("ALT + TAB", hl.dsp.focus({ workspace = "previous" }))

-- Special Workspace (Scratchpad)
hl.bind(main_mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(main_mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through Workspaces
hl.bind(main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse Binds
hl.bind(main_mod .. " + mouse:272", function() hl.dispatch("movewindow") end)
hl.bind(main_mod .. " + mouse:273", function() hl.dispatch("resizewindow") end)

-- Locked Media Key Binds
local locked_binds = {
    { "", "XF86AudioNext", hl.dsp.exec_cmd("playerctl next") },
    { "", "XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause") },
    { "", "XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause") },
    { "", "XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous") },
    { "", "XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+") },
    { "", "XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-") },
    { "", "XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle") },
    { "", "PRINT", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only") },
}

for _, b in ipairs(locked_binds) do
    hl.bind(b[1] ~= "" and (b[1] .. " + " .. b[2]) or b[2], b[3], { locked = true })
end
