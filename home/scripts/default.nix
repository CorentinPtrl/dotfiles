{ config, lib, pkgs, ... }:

let
  wallpaper_random = pkgs.writeShellScriptBin "wallpaper_random" ''
    if command -v swww >/dev/null 2>&1; then 
        swww img $(find ~/.config/swww/wallpapers/. -name "*.png" | shuf -n1) --transition-type random
    fi
  '';  
  dynamic_wallpaper = pkgs.writeShellScriptBin "dynamic_wallpaper" ''
    if command -v swww >/dev/null 2>&1; then 
        wallpaper_random
        while true; do
            sleep 120
            wallpaper_random
        done
    fi
  '';
in
{
  home.packages = with pkgs; [
    wallpaper_random
    dynamic_wallpaper
  ];
}
