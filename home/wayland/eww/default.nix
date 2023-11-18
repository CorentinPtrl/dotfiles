{ config, lib, pkgs, ... }:

{
  home.packages = (with pkgs; [ 
    eww-wayland
    socat
    dunst
  ]);
  home.file = {
      ".config/eww" = {
        source = ./config/eww;
        recursive = true;
    };
  };
}
