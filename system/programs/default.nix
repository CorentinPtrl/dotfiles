{
  imports = [
    ./fonts.nix
    ./home-manager.nix
    ./qt.nix
    ./xdg.nix
  ];

  programs = {
    anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
    anime-games-launcher.enable = true;
    honkers-railway-launcher.enable = true;
    honkers-launcher.enable = true;
    wavey-launcher.enable = true;
    sleepy-launcher.enable = true;

    nix-ld.enable = true;
    # make HM-managed GTK stuff work
    dconf.enable = true;

    seahorse.enable = true;
   steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
};
  };
}
