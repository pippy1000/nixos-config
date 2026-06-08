{
  config,
  lib,
  pkgs,
  hyprland,
  ...
}: {
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
  services.asusd.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  systemd.services."getty@tty1" = {
    enable = true;
    wantedBy = ["multi-user.target"];
  };
  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
    withUWSM = true;
  };
  users.users.ethan = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "gamemode" "libvirtd"];
    hashedPassword = "$6$kvrvq7Da3uaaImZn$8cWprF20AI8mp90F4Dry4KVvOMSUZ2kRgWhNRkEY11iolOGaNjLYA/XnkIhA53fWU8HBNltbRa6rmNoW7qORD1";
    packages = with pkgs; [
      tree
    ];
  };
  users.users.root.hashedPassword = "$6$kvrvq7Da3uaaImZn$8cWprF20AI8mp90F4Dry4KVvOMSUZ2kRgWhNRkEY11iolOGaNjLYA/XnkIhA53fWU8HBNltbRa6rmNoW7qORD1";
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
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
    fastfetch
    spotify
    libreoffice
    neovim
    nodejs
    ripgrep
    gnumake
    gcc
    lua-language-server
    vscode-langservers-extracted
    intelephense
    typescript-language-server
    typescript
    nil
    clang-tools
    alejandra
    brightnessctl
    tree-sitter
  ];
  environment.variables.EDITOR = "nvim";
  boot.kernelModules = ["kvm-intel" "vfio" "vfio_iommu_type1" "vfio_pci"];
  boot.kernelParams = ["intel_iommu=on" "iommu=pt"];
  virtualisation.libvirtd = {
    enable = true;
    qemu.swtpm.enable = true;
    extraConfig = ''
      log_filters="3:qemu 1:libvirt"
      log_outputs="2:file:/var/log/libvirtd.log"
    '';
  };
  programs.virt-manager.enable = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "26.05";
}
