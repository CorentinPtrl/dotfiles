{ config, pkgs, user, ... }:

{
  home.packages = with pkgs; [
    # archives
    zip
    rar
    p7zip
    
    # utils
    file
    du-dust
    duf
    fd
    jq
    ripgrep
    upower
    speedtest-cli
    nmap
    progress

    #tops
    htop
    btop
 
    # file managers
    ranger
    
    eza
  ];
}
