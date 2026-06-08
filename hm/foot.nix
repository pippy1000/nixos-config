{
  config,
  pkgs,
  ...
}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=11";
        # pad adds breathing room around the terminal content
        pad = "8x8";
      };
      mouse = {
        # hides the mouse cursor when you start typing
        hide-when-typing = "yes";
      };
      tweak = {
        font-monospace-warn = "no";
      };
      colors-dark = {
        foreground = "c0caf5";
        background = "1a1b26";

        # Alpha on the background (0.0 = fully transparent, 1.0 = solid)
        # gives you a subtle transparency effect
        alpha = "0.95";

        # These are the 16 terminal colors apps use for syntax highlighting,
        # git diff colors, ls colors, etc. Without these your terminal falls
        # back to ugly defaults.

        # Normal colors (0-7)
        regular0 = "15161e"; # black
        regular1 = "f7768e"; # red
        regular2 = "9ece6a"; # green
        regular3 = "e0af68"; # yellow
        regular4 = "7aa2f7"; # blue
        regular5 = "bb9af7"; # magenta
        regular6 = "7dcfff"; # cyan
        regular7 = "a9b1d6"; # white

        # Bright colors (8-15) — used when apps request "bold" or "bright"
        bright0 = "414868"; # bright black
        bright1 = "f7768e"; # bright red
        bright2 = "9ece6a"; # bright green
        bright3 = "e0af68"; # bright yellow
        bright4 = "7aa2f7"; # bright blue
        bright5 = "bb9af7"; # bright magenta
        bright6 = "7dcfff"; # bright cyan
        bright7 = "c0caf5"; # bright white
      };
    };
  };
}
