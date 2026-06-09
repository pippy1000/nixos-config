{
    description = "Hyprland on Nixos";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprpanel = {
            url = "github:Jas-SinghFSU/HyprPanel";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland = {
            url = "github:hyprwm/Hyprland/v0.55.0";
        };
        quickshell = {
            url = "github:outfoxxed/quickshell";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        noctalia = {
            url = "github:noctalia-dev/noctalia-shell";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { nixpkgs, home-manager, hyprpanel, hyprland, quickshell, noctalia, ... }: {
        nixosConfigurations = {
            hyprland-btw = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit hyprland noctalia; };
                modules = [
                    ./configuration.nix
                    ./hosts/desktop/hardware-configuration.nix
                    ./hosts/desktop/nvidia.nix
                    ./hosts/desktop/gaming.nix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.ethan = import ./hm/default.nix;
                            backupFileExtension = "backup";
                            extraSpecialArgs = { inherit hyprpanel; };
                        };
                    }
                ];
            };
            hyprland-lapbtw = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit hyprland noctalia; };
                modules = [
                    ./configuration.nix
                    ./hosts/laptop/hardware-configuration.nix
                    ./hosts/laptop/nvidia.nix
                    ./hosts/desktop/gaming.nix
                    ({ lib, ... }: { networking.hostName = lib.mkForce "hyprland-lapbtw"; })
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.ethan = import ./hm/default.nix;
                            backupFileExtension = "backup";
                            extraSpecialArgs = { inherit hyprpanel; };
                        };
                    }
                ];
            };
        };
    };
}
