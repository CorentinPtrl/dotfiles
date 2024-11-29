{ config, pkgs, user, ... }:

{
  environment.systemPackages = with pkgs; [
    platformio
  ];

  services.udev.packages = [ 
    pkgs.platformio-core
    pkgs.openocd
  ];
}

