{ config, lib, pkgs, ... }:

{
    programs.waybar = {
      enable = true;
      systemd = {
        enable = false;
        target = "graphical-session.target";
      };
    };

  home.file = {
      ".config/waybar" = {
        source = ./config/waybar;
        recursive = true;
    };
  };
}