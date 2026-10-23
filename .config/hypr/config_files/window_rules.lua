-- Window Rules

-- Suppress maximize event for all windows
hl.window_rule({
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix dragging issues with XWayland floating windows
hl.window_rule({
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})
