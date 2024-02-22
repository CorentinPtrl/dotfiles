{ hyprland, pkgs, ...}: 
let
 lutgen = pkgs.callPackage ../pkgs/lutgen.nix { };
 zed = pkgs.callPackage ../pkgs/zed.nix { };
in
{

  home = {
    username = "corentin";
    homeDirectory = "/home/corentin";
  };

  home.packages = [ 
    pkgs.nano
    pkgs.wget
    pkgs.git
    pkgs.curl 
    pkgs.appimage-run
    pkgs.sshpass
    pkgs.jdk17
    pkgs.dotnet-sdk_7
    pkgs.sshs
    pkgs.openvpn
    pkgs.gh
    (pkgs.python311.withPackages (ps: with ps; [
      pip
      pycryptodome
      setuptools
    ]))
    pkgs.obs-studio
    lutgen
    zed
   ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
