{
  inputs,
  sharedModules,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
  in {
    asrock = nixosSystem {
      modules =
        [
          ./asrock
           ../modules/core.nix
           ../modules/fonts.nix
           ../modules/virtualisation.nix
          {home-manager.users.corentin.imports = homeImports."corentin@asrock";}
        ]
        ++ sharedModules;
    };

    zenbook = nixosSystem {
      modules =
        [
          ./zenbook
          {home-manager.users.corentin.imports = homeImports."corentin@zenbook";}
        ]
        ++ sharedModules;
    };
  };
}
