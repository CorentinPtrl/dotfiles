{ hyprland, pkgs, ...}: {

  imports = [
    hyprland.homeManagerModules.default
    #./environment
    ./programs
    ./scripts
    ./themes
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
    eza
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
    unzip
    speedtest-cli
    pavucontrol
    polkit_gnome
    ktlint
    ansible
    sshpass
    minecraft
    jdk17
    jetbrains-toolbox
    notion-app-enhanced
    rar
    filezilla
    gradle
    nmap
    python3
    ipscan
    dotnet-sdk_7
    google-chrome
    jd-gui
    zip
    atlassian-jira
    ganttproject-bin
    arduino
    sshs
    p7zip
    polkit
    polkit_gnome
    polkit-kde-agent
    postgresql_14
    minio-client
    rustup
    gcc
    gnumake
    prismlauncher-unwrapped
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
