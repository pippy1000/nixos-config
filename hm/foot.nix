{ config, pkgs, ... }:
{
    programs.foot = {
        enable = true;
        settings = {
            main = {
                font = "monospace:size=11";
            };
            tweak = {
                font-monospace-warn = "no";
            };
            colors-dark = {
                background = "1a1b26";
                foreground = "c0caf5";
            };
        };
    };
}
