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
    };
    outputs = { nixpkgs, home-manager, hyprpanel, ... }: {
        nixosConfigurations = {
            hyprland-btw = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./configuration.nix
                    ./etc/nixos/hardware-configuration.nix
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
                modules = [
                    ./configuration.nix
                    ./hosts/laptop/hardware-configuration.nix
                    ./hosts/laptop/nvidia.nix
                    ./hosts/desktop/gaming.nix
                    { networking.hostName = "hyprland-lapbtw"; }
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
