{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
#    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, ... }@inputs: 
# let
#    overlays = [
#      inputs.neovim-nightly-overlay.overlays.default
#   ];
# in
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	modules = [
	  ./configurations/work.nix
	  nixos-wsl.nixosModules.default
	  home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.nixos = import ./home/users/work;
	  }
	# {
	#   nixpkgs.overlays = overlays;
	# }
	];
      };
    };
  };
}

