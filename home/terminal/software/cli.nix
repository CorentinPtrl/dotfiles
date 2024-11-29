{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar

    # misc
    libnotify
    fontconfig

    # utils
    dijo
    du-dust
    duf
    fd
    file
    jaq
    ripgrep
    killall

    t-rec
    yt-dlp
    cfspeedtest
    htop
    btop
    sshs
  ];

  programs = {
    eza.enable = true;
    dircolors = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
