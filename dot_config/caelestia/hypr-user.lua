-- Personal monitor layout
hl.monitor({
    output = "eDP-1",
    mode = "2560x1600@240",
    position = "auto",
    scale = 1.33,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "auto",
    scale = 1,
})

-- Personal workspace placement
for i = 1, 3 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "eDP-1",
    })
end

for i = 4, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "HDMI-A-1",
    })
end

-- Personal environment
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

-- Personal startup
hl.on("hyprland.start", function()
    hl.exec_cmd("keyd-application-mapper")
end)

-- Personal external-monitor brightness workaround
hl.bind(
    "SUPER + XF86MonBrightnessUp",
    hl.dsp.exec_cmd("ddcutil --Display 1 setvcp 10 + 5")
)

hl.bind(
    "SUPER + XF86MonBrightnessDown",
    hl.dsp.exec_cmd("ddcutil --Display 1 setvcp 10 - 5")
)

-- Personal system/workflow shortcuts
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("shutdown now"))
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("reboot"))
hl.bind("SUPER + O", hl.dsp.exec_cmd("obsidian"))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("ghostty -e bash ~/scripts/to-brain.sh"))
hl.bind("SUPER + SHIFT + H", hl.dsp.exec_cmd("ghostty -e bash ~/scripts/to-hand.sh"))
hl.bind("SUPER + SHIFT + K", hl.dsp.exec_cmd("ollama stop ice-brain && ollama stop ice-hand"))
hl.bind("SUPER + SHIFT + F23", hl.dsp.exec_cmd('zen-browser "http://localhost:3000"'))

-- Personal application shortcuts not covered by Caelestia variables
hl.bind("SUPER + G", hl.dsp.exec_cmd("app2unit -- github-desktop"))
hl.bind("SUPER + ALT + E", hl.dsp.exec_cmd("app2unit -- nemo"))
hl.bind("CTRL + ALT + Escape", hl.dsp.exec_cmd("app2unit -- qps"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("dbeaver"))

-- Personal window border colours
hl.config({
    general = {
        col = {
            active_border = "rgba(c7c7c7e6)",
            inactive_border = "rgba(ababab11)",
        },
    },
})

-- Personal smart single-window styling
hl.window_rule({
    match = {
        float = false,
        workspace = "w[tv1]s[false]",
    },
    border_size = 0,
    rounding = 0,
})

hl.window_rule({
    match = {
        float = false,
        workspace = "f[1]s[false]",
    },
    border_size = 0,
    rounding = 0,
})

-- Fn-Lock Print key actually emits SUPER+SHIFT+S.
-- Replace Caelestia's native screenshot-freeze action.
hl.bind(
    "SUPER + SHIFT + S",
    hl.dsp.exec_cmd("$HOME/.local/bin/caelestia-print-screenshot")
)

-- Region screenshot
hl.bind(
    "ALT + S",
    hl.dsp.exec_cmd("$HOME/.local/bin/caelestia-region-screenshot")
)
