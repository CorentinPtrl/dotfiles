{
  imports = [
    ../../.
    ../../programs
    ../../wayland
    ../../terminals/kitty.nix
  ];

  home.sessionVariables = {
    GDK_SCALE = "2";
  };
}
