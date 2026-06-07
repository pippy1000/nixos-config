{ config, pkgs, ... }:
{
    services.hyprpaper = {
        enable = true;
        settings = {
            preload = [ "/home/ethan/walls/wall.jpg" ];
            wallpaper = [
                "HDMI-A-3,/home/ethan/walls/wall.jpg"
                "DP-2,/home/ethan/walls/wall.jpg"
                "DP-4,/home/ethan/walls/wall.jpg"
            ];
        };
    };
}
