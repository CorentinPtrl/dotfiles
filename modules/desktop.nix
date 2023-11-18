{ config, pkgs, user, ... }:

{
  home.packages = (with pkgs; [
    brave
    discord
    spotify
    pavucontrol
    minecraft
    jetbrains-toolbox
    notion-app-enhanced
    filezilla
    ipscan
    google-chrome
    jd-gui
    ganttproject-bin
    polkit
    polkit_gnome
    polkit-kde-agent
    prismlauncher-unwrapped
    steam
    steamcmd
    bibata-cursors
    catimg
  ]) ++ (with pkgs.gnome; [ 
    nautilus
    zenity
    gnome-tweaks
    gnome-control-center
    eog
  ]);
}
