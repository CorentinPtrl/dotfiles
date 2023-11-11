{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    twemoji-color-font
  ];
  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      corefonts      
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      nerdfonts
      twemoji-color-font
      crimson
      corefonts # Microsoft free fonts
      dejavu_fonts
      font-awesome
      inconsolata # monospaced
      noto-fonts-emoji
      noto-fonts-extra
      powerline-fonts
      symbola
    ];
  };

}
