{
  imports = [
    # editors
#    ../../editors/vscode
    ../../editors/jetbrain

    # services
    ../../services/ags

    # media services
    ../../services/media/playerctl.nix

    # software
    ../../software
    ../../software/wayland

    # system services
    ../../services/system/gpg-agent.nix
    ../../services/system/polkit-agent.nix
    ../../services/system/screensht.nix
    ../../services/system/syncthing.nix

    # wayland specific
    ../../services/wayland/hyprpaper.nix

    # terminal emulators
    ../../terminal/emulators/kitty.nix
    ../../terminal/emulators/foot.nix
  ];
}
