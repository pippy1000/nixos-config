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
      share = true;
    };
    shellAliases = {
      btw = "echo i use hyprland btw";
      ll = "ls -la";
      la = "ls -la";
      ".." = "cd ..";
      "..." = "cd ../..";
      nixswitch = "sudo nixos-rebuild switch --flake ~/nixos-config#hyprland-btw";
      nixlap = "sudo nixos-rebuild switch --flake ~/nixos-config#hyprland-lapbtw";
      nixup = "sudo nix flake update ~/nixos-config";
    };
    initContent = "pokemon-colorscripts --no-title -r";
  };
}
