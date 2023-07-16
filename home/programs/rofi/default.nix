{config, pkgs, ...}: {
  programs.rofi = {
    enable = true;
  };

  home.file = {
      ".config/rofi/fonts.rasi" = {
        source = ./fonts.rasi;
        recursive = true;
    };
      ".config/rofi/config.rasi" = {
        source = ./config.rasi;
        recursive = true;
    };
      ".config/rofi/colors.rasi" = {
        source = ./colors.rasi;
        recursive = true;
    };
  };
}
