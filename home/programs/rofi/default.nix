{config, pkgs, ...}: {
  programs.rofi = {
    enable = true;
    theme = ./config.rasi;
  };

  home.file = {
      ".config/rofi/fonts.rasi" = {
        source = ./fonts.rasi;
        recursive = true;
    };
      ".config/rofi/colors.rasi" = {
        source = ./colors.rasi;
        recursive = true;
    };
  };
}
