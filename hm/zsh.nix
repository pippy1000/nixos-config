{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      ignoreDups = true;
      share = true; # share history across all terminal windows
    };

    shellAliases = {
      btw = "echo i use hyprland btw";
      ll = "ls -la";
      la = "ls -la";
      ".." = "cd ..";
      "..." = "cd ../..";
      nixswitch = "sudo nixos-rebuild switch --flake ~/.config/nixos#hyprland-btw";
      nixlap = "sudo nixos-rebuild switch --flake ~/.config/nixos#hyprland-lapbtw";
      nixup = "sudo nix flake update ~/.config/nixos";
    };

    # loginExtra runs on login shell — this is where uwsm autostart goes
    loginExtra = ''
      if uwsm check may-start; then
          exec uwsm start hyprland.desktop
      fi
    '';
  };
}
