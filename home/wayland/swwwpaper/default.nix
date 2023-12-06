{ config, lib, pkgs, ... }:

{
  home.file = {
      ".config/swww/swwwpaper" = {
        source = ./swwwpaper.sh;
    };
    ".config/swww/wallpapers" = {
        source = ./wallpapers;
        recursive = true;
    };
  };
}
