{ hyprland, pkgs, ...}: {

  home = {
    username = "corentin";
    homeDirectory = "/home/corentin";
  };

  home.packages = (with pkgs; [ 
    nano
    wget
    git
    curl 
    appimage-run
    sshpass
    jdk17
    dotnet-sdk_7
    sshs
    openvpn
    gh
    (python311.withPackages (ps: with ps; [
      pip
      pycryptodome
      setuptools
    ]))
   ]);

  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
