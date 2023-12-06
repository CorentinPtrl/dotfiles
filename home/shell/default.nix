{ config, pkgs, user, ... }:

{
  imports = [
    ./cli.nix
    ./starship.nix
    ./zsh.nix
  ];
}
