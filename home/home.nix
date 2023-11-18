{ hyprland, pkgs, ...}: {

  imports = [
    hyprland.homeManagerModules.default
    ./programs
    ./scripts
    ./themes
  ];

  home = {
    username = "corentin";
    homeDirectory = "/home/corentin";
  };

  home.packages = (with pkgs; [ 
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
    jq
    htop
    spotify
    upower
    unzip
    speedtest-cli
    pavucontrol
    polkit_gnome
    ktlint
    (ansible.override { windowsSupport = true; })
    sshpass
    minecraft
    jdk17
    jetbrains-toolbox
    notion-app-enhanced
    rar
    filezilla
    gradle
    nmap
    ipscan
    dotnet-sdk_7
    google-chrome
    jd-gui
    zip
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
    steam
    progress
    openvpn
    gh
    vmware-horizon-client
    packer
    (python311.withPackages (ps: with ps; [
      pip
      pycryptodome
      setuptools
    ]))
    mpvpaper
    steamcmd
   ]) ++ (with pkgs.gnome; [ 
    nautilus
    zenity
    gnome-tweaks
    gnome-control-center
    eog
  ]);

  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
