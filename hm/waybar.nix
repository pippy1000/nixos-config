{ config, pkgs, ... }:
{
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 30;
                modules-left = [ "hyprland/workspaces" ];
                modules-center = [ "clock" ];
                modules-right = [ "pulseaudio" "network" "cpu" "memory" "tray" ];

                "hyprland/workspaces" = {
                    format = "{id}";
                    on-click = "activate";
                };

                clock = {
                    format = "{:%H:%M %a %b %d}";
                    tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                };

                cpu = {
                    format = " {usage}%";
                    interval = 2;
                };

                memory = {
                    format = " {}%";
                    interval = 2;
                };

                network = {
                    format-wifi = " {signalStrength}%";
                    format-ethernet = " {ipaddr}";
                    format-disconnected = "disconnected";
                    tooltip-format = "{ifname}: {ipaddr}";
                };

                pulseaudio = {
                    format = "{icon} {volume}%";
                    format-muted = " muted";
                    format-icons = {
                        default = [ "" "" "" ];
                    };
                    on-click = "pavucontrol";
                };

                tray = {
                    spacing = 10;
                };
            };
        };
        style = ''
            * {
                font-family: "JetBrainsMono Nerd Font";
                font-size: 13px;
            }

            window#waybar {
                background-color: rgba(26, 27, 38, 0.9);
                color: #c0caf5;
                border-bottom: 2px solid rgba(100, 114, 125, 0.5);
            }

            #workspaces button {
                padding: 0 8px;
                color: #c0caf5;
                background: transparent;
                border: none;
            }

            #workspaces button.active {
                color: #7aa2f7;
                border-bottom: 2px solid #7aa2f7;
            }

            #clock, #cpu, #memory, #network, #pulseaudio, #tray {
                padding: 0 10px;
                color: #c0caf5;
            }
        '';
    };
}
