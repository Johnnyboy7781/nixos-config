{
    description = "Jojo's NixOS Config :^)";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        sops-nix.url = "github:Mic92/sops-nix";
        josh.url = "github:Johnnyboy7781/josh";
    };

    outputs = { nixpkgs, nixos-wsl, home-manager, sops-nix, josh, ... }: 
    {
        nixosConfigurations = {
            nixos = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {
                    joshPkg = josh.packages."x86_64-linux".josh;
                };
                modules = [
                    ./configurations/work.nix
                    nixos-wsl.nixosModules.default
                    home-manager.nixosModules.home-manager
                    sops-nix.nixosModules.sops
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.nixos = import ./home/users/work;
                        home-manager.sharedModules = [
                            sops-nix.homeManagerModules.sops
                        ];
                    }
                ];
            };
        };
    };
}

