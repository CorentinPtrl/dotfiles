{
  self,
  inputs,
  ...
}: let
  # get these into the module system
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "corentin@zenbook" = [
      ../.
      ./zenbook
    ];
    "corentin@ryzen" = [
      ../.
      ./ryzen
    ];
    "corentin@ccl" = [
      ../.
      ./ccl
    ];
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  _module.args = {inherit homeImports;};

  flake = {
    homeConfiguration = {
      "corentin_zenbook" = homeManagerConfiguration {
        modules = homeImports."corentin@zenbook";
        username = "corentin";
        homeDirectory = "/home/corentin";
        inherit pkgs extraSpecialArgs;
      };
      "corentin_ryzen" = homeManagerConfiguration {
        modules = homeImports."corentin@ryzen";
        username = "corentin";
        homeDirectory = "/home/corentin";
        inherit pkgs extraSpecialArgs;
      };
      "corentin_ccl" = homeManagerConfiguration {
        modules = homeImports."corentin@ccl";
        username = "corentin";
        homeDirectory = "/home/corentin";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
