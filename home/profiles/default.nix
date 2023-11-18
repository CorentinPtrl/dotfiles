{
  self,
  inputs,
  withSystem,
  module_args,
  ...
}: let
  sharedModules = [
    ../.
    ../shell
  ];

  homeImports = {
    "corentin@asrock" = [./asrock] ++ sharedModules;
    "corentin@zenbook" = [./zenbook] ++ sharedModules;
  };
in {
  flake = {
    homeConfigurations = withSystem "x86_64-linux" ({pkgs, ...}: {
      "corentin@asrock" = homeManagerConfiguration {
        modules = homeImports."corentin@asrock";
        inherit pkgs;
      };

      "corentin@zenbook" = homeManagerConfiguration {
        modules = homeImports."corentin@zenbook";
        inherit pkgs;
      };
    });
  };
}
