{
  imports = [
    ../../.
    ../../programs
    ../../wayland
    ../../terminals/kitty.nix
#    ../../../modules/core.nix
    ../../../modules/desktop.nix
    ../../../modules/dev.nix
#    ../../../modules/fonts.nix
#    ../../../modules/virtualisation.nix
  ];

  home.sessionVariables = {
    GDK_SCALE = "2";
  };
}
