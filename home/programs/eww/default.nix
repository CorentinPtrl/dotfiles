{ config, lib, pkgs, ... }:

{
    programs.eww = {
        enable = true;
    };

    home.file = {
     ".config/eww" = {
        source = ./config;
        recursive = true;
    };
  };
}