{
  self,
  inputs,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = let
    # shorten paths
    inherit (inputs.nixpkgs.lib) nixosSystem;
    mod = "${self}/system";

    # get the basic config to build on top of
    inherit (import "${self}/system") desktop;

    # get these into the module system
    specialArgs = {inherit inputs self;};
  in {
    zenbook = nixosSystem {
      inherit specialArgs;
      modules =
        desktop
        ++ [
          ./zenbook
          "${mod}/programs/hyprland.nix"
          "${mod}/services/gnome-services.nix"
          "${mod}/services/location.nix"
          {
            home-manager = {
              users.corentin.imports =
                homeImports."corentin@zenbook";
              extraSpecialArgs = specialArgs;
            };
          }

          inputs.agenix.nixosModules.default
        ];
    };
    technofy = nixosSystem {
      inherit specialArgs;
      modules =
        desktop
        ++ [
          ./technofy
          {
            home-manager = {
              users.corentin.imports =
                homeImports."corentin@technofy";
              extraSpecialArgs = specialArgs;
            };
          }

          inputs.agenix.nixosModules.default
        ];
    };
  };
}
