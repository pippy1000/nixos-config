{ config, pkgs, ... }:
{
    wayland.windowManager.hyprland.enable = false;

    xdg.configFile."hypr/hyprland.lua" = {
        source = ./hyprland.lua;
        force = true;
        onChange = ''
            cp ${./hyprland.lua} $HOME/.config/hypr/hyprland.lua
        '';
    };

    home.activation.copyHyprlandLua = config.lib.dag.entryAfter ["writeBoundary"] ''
        cp -f ${./hyprland.lua} $HOME/.config/hypr/hyprland.lua
    '';
}
