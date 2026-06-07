-- Monitors
hl.monitor({ output = "HDMI-A-3", mode = "1920x1080@60", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-4", mode = "1920x1080@144", position = "3840x0", scale = 1 })
hl.monitor({ output = "DP-2", mode = "1920x1080@165", position = "1920x0", scale = 1 })

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("awww-daemon & hyprpanel &")
end)

-- Environment
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("NIXOS_OZONE_WL", "1")
hl.env("HYPRLOCK_RENDERER", "vulkan")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")

-- General settings
hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 2,
        border_size = 1,
        col = {
            active_border = { colors = {"rgba(bb9af7ee)", "rgba(7aa2f7ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 0,
        rounding_power = 0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0,
        repeat_rate = 25,
        repeat_delay = 600,
        touchpad = {
            natural_scroll = false,
        },
    },
    cursor = {
        inactive_timeout = 30,
        no_hardware_cursors = true,
    },
})

-- Animations
hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
hl.animation({ leaf = "windows",    enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",     enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle",enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",       enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6,  bezier = "default" })

-- Keybinds
local mainMod = "SUPER"
local terminal = "foot"
local fileManager = "dolphin"
local menu = "wofi --show drun"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",      hl.dsp.window.close())
hl.bind(mainMod .. " + M",      hl.dsp.exec_cmd("hyprctl dispatch exit"))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",      hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D",      hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + R",      hl.dsp.exec_cmd("pkill waybar; waybar &"))
hl.bind(mainMod .. " + B",      hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + L",      hl.dsp.exec_cmd("hyprlock"))

-- Workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Mouse window management
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Brightness
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })

-- Window rules
hl.window_rule({
    name = "suppress-maximize",
    match = { class = ".*" },
    suppress_event = "maximize",
})
