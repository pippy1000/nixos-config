{ config, lib, pkgs, ... }:
{

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    nixpkgs.config.allowUnfree = true;

    networking.hostName = "hyprland-btw";
    networking.networkmanager.enable = true;

    time.timeZone = "America/Chicago";

    services.getty.autologinUser = "ethan";
    services.upower.enable = true;
    services.blueman.enable = true;
    services.openssh.enable = true;  

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
        hashedPassword = "$6$kvrvq7Da3uaaImZn$8cWprF20AI8mp90F4Dry4KVvOMSUZ2kRgWhNRkEY11iolOGaNjLYA/XnkIhA53fWU8HBNltbRa6rmNoW7qORD1";
        packages = with pkgs; [
            tree
        ];
    };
    users.users.root.hashedPassword = "$6$kvrvq7Da3uaaImZn$8cWprF20AI8mp90F4Dry4KVvOMSUZ2kRgWhNRkEY11iolOGaNjLYA/XnkIhA53fWU8HBNltbRa6rmNoW7qORD1";
    
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
        libreoffice
        neovim
    ];

    environment.variables.EDITOR = "nvim";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
   
    system.stateVersion = "26.05";
}
