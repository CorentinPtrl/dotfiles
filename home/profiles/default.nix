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
    module_args
    inputs.hyprland.homeManagerModules.default
  ];

  homeImports = {
    "corentin@asrock" = [./asrock] ++ sharedModules;
    "corentin@zenbook" = [./zenbook] ++ sharedModules;
  };
  inherit (inputs.home-manager.lib) homeManagerConfiguration;
in {
  imports = [
    # we need to pass this to NixOS' HM module
    {_module.args = {inherit homeImports;};}
  ];

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
