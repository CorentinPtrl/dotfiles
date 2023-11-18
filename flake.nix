{
  description = "My flake";
  
inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  home-manager = {
   url = "github:nix-community/home-manager";
   inputs.nixpkgs.follows = "nixpkgs";
  };
  hyprland.url = "github:hyprwm/Hyprland";
  aagl.url = "github:ezKEa/aagl-gtk-on-nix";
  aagl.inputs.nixpkgs.follows = "nixpkgs";
  terraform-providers-bin.url = "github:nix-community/nixpkgs-terraform-providers-bin";
  terraform-providers-bin.inputs.nixpkgs.follows = "nixpkgs";
};

outputs = { self, nixpkgs, home-manager, hyprland, aagl, terraform-providers-bin, ...}: 

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
	  config.allowUnfree = true;	
  };
  lib = nixpkgs.lib;
  terraform-providers = terraform-providers-bin.legacyPackages.${system};
in {
nixosConfigurations = {
    "corentin@zenbook" = lib.nixosSystem rec {
      inherit system;
      specialArgs = { inherit hyprland terraform-providers; };
      modules = [ 
        ./nixos/zenbook/configuration.nix
        hyprland.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
        }
      ];
    };
  asrock = lib.nixosSystem rec {
      inherit system;
      specialArgs = { inherit hyprland terraform-providers; };
      modules = [ 
        ./hosts/asrock/default.nix
        ./modules/core.nix
        ./modules/desktop.nix
        ./modules/dev.nix
        ./modules/fonts.nix
	./modules/virtualisation.nix
        hyprland.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          imports = [ aagl.nixosModules.default ];
          nix.settings = aagl.nixConfig; # Set up Cachix
          programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
        }
      ];
    };
  };
};
}
