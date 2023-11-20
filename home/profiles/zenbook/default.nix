{
  imports = [
    ../../.
    ../../programs
    ../../wayland
    ../../terminals/kitty.nix
    ../../../modules/desktop.nix
    ../../../modules/dev.nix
  ];

  home.sessionVariables = {
    GDK_SCALE = "2";
  };
}
