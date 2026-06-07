{ config, pkgs, ... }:
{
    services.hypridle = {
        enable = true;
        settings = {
            general = {
                lock_cmd = "hyprlock";
                before_sleep_cmd = "hyprlock";
            };
            listener = [
                {
                    timeout = 300;
                    on-timeout = "hyprlock";
                }
                {
                    timeout = 600;
                    on-timeout = "hyprctl dispatch dpms off";
                    on-resume = "hyprctl dispatch dpms on";
                }
            ];
        };
    };
}
