{
  config,
  lib,
  pkgs,
  hyprland,
  noctalia,
  ...
}: {
  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = ["kvm-intel"];
  boot.initrd.kernelModules = ["vfio_pci" "vfio" "vfio_iommu_type1"];
  boot.kernelParams = ["intel_iommu=on" "iommu=pt"];

  # Networking
  networking.hostName = "hyprland-btw";
  networking.networkmanager.enable = true;

  # Locale
  time.timeZone = "America/Chicago";

  # Nix
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Display manager
  services.greetd.enable = true;
  programs.regreet = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };
    cursorTheme.name = "Adwaita";
    theme.name = "Adwaita-dark";
  };

  # Compositors
  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
    withUWSM = true;
  };
  programs.niri.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Shell
  programs.zsh.enable = true;

  # Hardware
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Services
  services.upower.enable = true;
  services.blueman.enable = true;
  services.openssh.enable = true;
  services.asusd.enable = true;

  # Portals
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto
  ];

  # Users
  users.users.ethan = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["wheel" "networkmanager" "gamemode" "libvirtd"];
    hashedPassword = "$6$kvrvq7Da3uaaImZn$8cWprF20AI8mp90F4Dry4KVvOMSUZ2kRgWhNRkEY11iolOGaNjLYA/XnkIhA53fWU8HBNltbRa6rmNoW7qORD1";
    packages = with pkgs; [tree];
  };
  users.users.root.hashedPassword = "$6$kvrvq7Da3uaaImZn$8cWprF20AI8mp90F4Dry4KVvOMSUZ2kRgWhNRkEY11iolOGaNjLYA/XnkIhA53fWU8HBNltbRa6rmNoW7qORD1";

  # Virtualisation
  virtualisation.libvirtd = {
    enable = true;
    qemu.swtpm.enable = true;
    extraConfig = ''
      log_filters="3:qemu 1:libvirt"
      log_outputs="2:file:/var/log/libvirtd.log"
    '';
  };
  programs.virt-manager.enable = true;

  # Packages
  programs.firefox.enable = true;
  environment.variables.EDITOR = "nvim";
  environment.systemPackages = with pkgs; [
    vim wget git neovim
    foot kitty
    waybar wofi
    hyprpaper hyprlock hyprpanel awww
    pavucontrol
    kdePackages.dolphin
    fastfetch btop
    spotify libreoffice
    nodejs ripgrep gnumake gcc
    lua-language-server
    vscode-langservers-extracted
    intelephense
    typescript-language-server typescript
    nil clang-tools alejandra
    brightnessctl tree-sitter
    prismlauncher
    niri xwayland-satellite
    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  system.stateVersion = "26.05";
}
