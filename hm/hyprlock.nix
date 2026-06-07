{ config, pkgs, ... }:
{
    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
                disable_loading_bar = true;
                hide_cursor = true;
                no_fade_in = true;
            };
            background = {
                path = "/home/ethan/walls/wall.jpg";
                blur_passes = 3;
                blur_size = 8;
            };
            input-field = {
                size = "300, 50";
                position = "0, -80";
                halign = "center";
                valign = "center";
                placeholder_text = "Password";
                border_color = "rgba(bb9af7ff)";
                inner_color = "rgba(1a1b26ff)";
                font_color = "rgba(c0caf5ff)";
            };
        };
    };
}
