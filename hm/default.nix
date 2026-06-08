{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./foot.nix
    ./vim.nix
    ./wofi.nix
    ./gtk.nix
    ./hyprpanel.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];

  home.username = "ethan";
  home.homeDirectory = "/home/ethan";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [fzf nix-search-tv];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
  ];

  home.pointerCursor = {
    gtk.enable = true;
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use hyprland btw";
    };
    profileExtra = ''
      if uwsm check may-start; then
          exec uwsm start hyprland.desktop
      fi
    '';
  };

  services.ssh-agent.enable = true;

  home.activation.installNvimConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p $HOME/.config/nvim
    cp -rf ${../nvim}/. $HOME/.config/nvim/
    chmod -R u+w $HOME/.config/nvim/
  '';
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
