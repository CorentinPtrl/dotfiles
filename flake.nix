{
  description = "My flake";
  
inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  home-manager = {
   url = "github:nix-community/home-manager";
   inputs.nixpkgs.follows = "nixpkgs";
  };
  flake-parts = {
   url = "github:hercules-ci/flake-parts";
   inputs.nixpkgs-lib.follows = "nixpkgs";
  };
  hyprland.url = "github:hyprwm/Hyprland";
  aagl.url = "github:ezKEa/aagl-gtk-on-nix";
  aagl.inputs.nixpkgs.follows = "nixpkgs";
  terraform-providers-bin.url = "github:CorentinPtrl/nixpkgs-terraform-providers-bin";
  terraform-providers-bin.inputs.nixpkgs.follows = "nixpkgs";
};

outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        ./home/profiles
        ./hosts
        ./modules
      ];

    };
}
