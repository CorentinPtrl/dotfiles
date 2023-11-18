{ config, pkgs, inputs, system, lib, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../home/profiles/asrock
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix-asrock";
  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];
  environment.etc = {
    "resolv.conf".text = "nameserver 1.1.1.1\n";
  };

  xserver.videoDrivers = ["nvidia"];

  #NvidiaConfig
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;

    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };
  security.polkit.enable = true;  
  security.rtkit.enable = true;
  security.pam.services.swaylock = {};
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.blueman.enable = true;

  # add /.local to $PATH
  environment.variables = {
   NIXOS_OZONE_WL = "1";
   PATH = [
     "\${HOME}/.local/bin"
     "\${HOME}/.config/rofi/scripts"
   ];
   NIXPKGS_ALLOW_UNFREE = "1";
  };
}
