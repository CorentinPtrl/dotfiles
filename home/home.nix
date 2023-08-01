{ hyprland, pkgs, ...}: {

  imports = [
    hyprland.homeManagerModules.default
    #./environment
    ./programs
    ./scripts
    ./themes
    ./games
  ];

  home = {
    username = "corentin";
    homeDirectory = "/home/corentin";
  };

  home.packages = (with pkgs; [ 
    cool-retro-term
    neovim
    nano
    wget
    grim
    slurp
    wl-clipboard
    pamixer
    mpc-cli
    discord
    exa
    btop
    ranger
    wlr-randr
    git
    gnumake
    curl
    appimage-run
    bibata-cursors
    catimg
    vscode
    nitch
    openrgb
    tty-clock
    xflux
    jq
    htop
    spotify
    upower
    jetbrains-toolbox
    unzip
    speedtest-cli
    pavucontrol
    polkit_gnome
    ktlint
    ansible
  ]) ++ (with pkgs.gnome; [ 
    nautilus
    zenity
    gnome-tweaks
    gnome-control-center
    eog
    gedit
  ]);

  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
