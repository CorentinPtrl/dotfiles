{
  pkgs,
  inputs,
  ...
}: 

let
 hyper = pkgs.callPackage ../../pkgs/hyper/default.nix { };
 zed = pkgs.callPackage ../../pkgs/zed/default.nix { };
 libpaseto = pkgs.callPackage ../../pkgs/libpaseto/default.nix { };
in
{
  imports = [
    ./anyrun
    ./waybar
    ./browsers/brave.nix
    ./gtk.nix
    ./media
  ];

  home.packages = [
    # messaging
    pkgs.tdesktop

    pkgs.xfce.thunar
    pkgs.xfce.thunar-archive-plugin
    pkgs.ps_mem

    pkgs.vesktop
    pkgs.discordo
    pkgs.discord

    # misc
    pkgs.pciutils
    pkgs.nixos-icons
    pkgs.colord
    pkgs.ffmpegthumbnailer
    pkgs.imagemagick
    pkgs.xfce.tumbler
    pkgs.xdotool
    pkgs.cliphist
    pkgs.rizin
    pkgs.xcolor
    pkgs.nodejs
    pkgs.nodePackages.pnpm
    pkgs.jq
    pkgs.socat
    pkgs.catimg
    pkgs.bun
    pkgs.swww
    pkgs.brave
    pkgs.kitty
    pkgs.gnome.file-roller
    pkgs.python311
    #pkgs.vcpkg
    inputs.matugen.packages.${pkgs.system}.default
    libpaseto
  ];
}
