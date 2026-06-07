{ config, lib, pkgs, ... }:
{

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    nixpkgs.config.allowUnfree = true;

    networking.hostName = "hyprland-lapbtw";
    networking.networkmanager.enable = true;

    time.timeZone = "America/Chicago";

    services.getty.autologinUser = "ethan";
    services.upower.enable = true;
    services.blueman.enable = true;
    
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;

    systemd.services."getty@tty1" = {
        enable = true;
        wantedBy = [ "multi-user.target" ];
    };

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        withUWSM = true;
    };

    users.users.ethan = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        packages = with pkgs; [
            tree
        ];
    };
    
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
    
    };

    programs.firefox.enable = true;
    
    fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        nerd-fonts.noto
    ];

    environment.systemPackages = with pkgs; [
        vim
        wget
        foot
        kitty
        waybar
        git
        hyprpaper
        pavucontrol
        wofi
        kdePackages.dolphin
        hyprpanel
        awww
        hyprlock
        hyprpanel
        fastfetch
        spotify
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
   
    system.stateVersion = "26.05";
}
