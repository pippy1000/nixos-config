{ config, pkgs, ... }:
{
    wayland.windowManager.hyprland = {
        enable = true;
        configType = "hyprlang";
        extraConfig = ''
            monitor=HDMI-A-3, 1920x1080@60, 0x0, 1
            monitor=DP-2, 1920x1080@165, 1920x0, 1
            monitor=DP-4, 1920x1080@144, 3840x0, 1
            $terminal = foot
            $fileManager = dolphin
            $menu = wofi --show drun
            $reload_waybar = pkill waybar; waybar &
            exec-once =  awww toggle & hyprpanel &
            env = XCURSOR_THEME,Adwaita
            env = XCURSOR_SIZE,24
            env = HYPRCURSOR_SIZE,24
            env = XDG_CURRENT_DESKTOP,Hyprland
            env = XDG_SESSION_TYPE,wayland
            env = NIXOS_OZONE_WL,1
            env = HYPRLOCK_RENDERER,vulkan
            env = WLR_NO_HARDWARE_CURSORS,1
            general {
                gaps_in = 2
                gaps_out = 2
                border_size = 1
                col.active_border = rgba(bb9af7ee) rgba(7aa2f7ee) 45deg
                col.inactive_border = rgba(595959aa)
                resize_on_border = false
                allow_tearing = false
                layout = dwindle
            }
            decoration {
                rounding = 0
                rounding_power = 0
                active_opacity = 1.0
                inactive_opacity = 1.0
                blur {
                    enabled = true
                    size = 3
                    passes = 1
                    vibrancy = 0.1696
                }
            }
            animations {
                enabled = true
                bezier = myBezier, 0.05, 0.9, 0.1, 1.05
                animation = windows, 1, 7, myBezier
                animation = windowsOut, 1, 7, default, popin 80%
                animation = border, 1, 10, default
                animation = borderangle, 1, 8, default
                animation = fade, 1, 7, default
                animation = workspaces, 1, 6, default
            }
            dwindle {
                preserve_split = true
            }
            master {
                new_status = master
            }
            misc {
                force_default_wallpaper = -1
                disable_hyprland_logo = false
            }
            input {
                kb_layout = us
                follow_mouse = 1
                sensitivity = 0
                repeat_rate = 25
                repeat_delay = 600
                touchpad {
                    natural_scroll = false
                }
            }
            cursor {
                inactive_timeout = 30
                no_hardware_cursors = true
            }
            $mainMod = SUPER
            bind = $mainMod, Return, exec, $terminal
            bind = $mainMod, Q, killactive,
            bind = $mainMod, M, exit,
            bind = $mainMod, E, exec, $fileManager
            bind = $mainMod, V, togglefloating,
            bind = $mainMod, D, exec, $menu
            bind = $mainMod, R, exec, $reload_waybar
            bind = $mainMod, B, exec, firefox
            bind = $mainMod, L, exec, hyprlock
            bind = $mainMod, 1, workspace, 1
            bind = $mainMod, 2, workspace, 2
            bind = $mainMod, 3, workspace, 3
            bind = $mainMod, 4, workspace, 4
            bind = $mainMod, 5, workspace, 5
            bind = $mainMod, 6, workspace, 6
            bind = $mainMod, 7, workspace, 7
            bind = $mainMod, 8, workspace, 8
            bind = $mainMod, 9, workspace, 9
            bind = $mainMod, 0, workspace, 10
            bind = $mainMod SHIFT, 1, movetoworkspace, 1
            bind = $mainMod SHIFT, 2, movetoworkspace, 2
            bind = $mainMod SHIFT, 3, movetoworkspace, 3
            bind = $mainMod SHIFT, 4, movetoworkspace, 4
            bind = $mainMod SHIFT, 5, movetoworkspace, 5
            bind = $mainMod SHIFT, 6, movetoworkspace, 6
            bind = $mainMod SHIFT, 7, movetoworkspace, 7
            bind = $mainMod SHIFT, 8, movetoworkspace, 8
            bind = $mainMod SHIFT, 9, movetoworkspace, 9
            bind = $mainMod SHIFT, 0, movetoworkspace, 10
            bind = $mainMod, mouse_down, workspace, e+1
            bind = $mainMod, mouse_up, workspace, e-1
            bindm = $mainMod, mouse:272, movewindow
            bindm = $mainMod, mouse:273, resizewindow
            windowrulev = suppressevent maximize, class:.*
        '';
    };
}
