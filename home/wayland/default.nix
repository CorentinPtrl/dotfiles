{ config, pkgs, user, ... }:

{
  imports = [
#    ./eww
    ./hypr
    ./swwwpaper
    ./waybar
    #./gtk.nix
  ];

  home.packages = with pkgs; [
    # screenshot
    grim
    slurp
    swaybg
    # utils
    wf-recorder
    wl-clipboard
    wlogout
    wlr-randr
  ];
}
