{ config, lib, pkgs, ... }:
{
  imports = [
    ./fonts
    ./virtualisation
    #./scripts
  ];

  #services.xserver.displayManager.sessionPackages = [ pkgs.hyprland ];
  #users.users.greeter.packages = [ pkgs.hyprland ];

  programs.regreet.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        user = "corentin";
        command = "$SHELL -l";
      };
    };
  };

programs = {
    zsh = {
      interactiveShellInit = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
           WLR_NO_HARDWARE_CURSORS=1 Hyprland #prevents cursor disappear when using Nvidia drivers
        fi
      '';
    };
  };

  programs.dconf.enable = true;

  xdg = {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
      gtkUsePortal = true;
    };
  };
}
