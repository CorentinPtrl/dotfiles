{
  imports = [
    ./fonts.nix
    ./home-manager.nix
    ./qt.nix
    ./xdg.nix
  ];

  programs = {
    nix-ld.enable = true;
    # make HM-managed GTK stuff work
    dconf.enable = true;

    seahorse.enable = true;
  };
}
