{ config, pkgs, lib, ... }:
{
    wayland.windowManager.hyprland.enable = false;

    home.activation.installHyprlandLua = lib.hm.dag.entryAfter ["writeBoundary"] ''
        mkdir -p $HOME/.config/hypr
        rm -f $HOME/.config/hypr/hyprland.lua
        cp ${./hyprland.lua} $HOME/.config/hypr/hyprland.lua
        chmod 644 $HOME/.config/hypr/hyprland.lua
    '';
}
