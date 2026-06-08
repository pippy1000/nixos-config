{ config, pkgs, lib, ... }:
{
    wayland.windowManager.hyprland.enable = false;

    xdg.configFile."hypr/hyprland.lua" = {
        source = ./hyprland.lua;
    };
}
