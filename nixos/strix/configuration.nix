{ config, pkgs, inputs, system, lib, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../hosts/strix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix-strix";
  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];
  environment.etc = {
    "resolv.conf".text = "nameserver 1.1.1.1\n";
  };

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";

   services.xserver = {
   enable = true;
    videoDrivers = ["nvidia"];
    # X11 keymap
    layout = "fr";
    xkbVariant = "";
  };

  #NvidiaConfig
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "#nvidia-x11"
    ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;

    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  services.gvfs.enable = true;

  console.keyMap = "fr";

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.blueman.enable = true;

  # add /.local to $PATH
  environment.variables={
   NIXOS_OZONE_WL = "1";
   PATH = [
     "\${HOME}/.local/bin"
     "\${HOME}/.config/rofi/scripts"
   ];
   NIXPKGS_ALLOW_UNFREE = "1";
  };
  #programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.enzo = {
    isNormalUser = true;
    description = "Enzo";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    #shell = pkgs.zsh;
    packages = with pkgs; [
      brave
      neofetch
      lolcat
      vmware-workstation
      thefuck
   ];
  };
  programs.zsh = {
    enable = true;
    ohMyZsh = {
       enable = true;
       plugins = [ "git" "thefuck" ];
       theme = "robbyrussell";
    };
  };
  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      right_format = "$time";
      line_break.disabled = true;
      azure = {
         disabled = false;
         format = "on [$symbol($username)]($style) ";
         symbol = "ﴃ ";
         style = "blue bold";
      };
      username = {
         #style_user = "bold dimmed blue";
         show_always = true;
      };
      hostname = {
         ssh_only = false;
      };
      package.disabled = true;
    };
  };

 virtualisation.vmware.host.enable = true;
  # Enable automatic login for the user.
  #services.xserver.displayManager.autoLogin.enable = true;
  #services.xserver.displayManager.autoLogin.user = "enzo";

  # Workaround for GNOME autologin:
  #systemd.services."getty@tty1".enable = false;
  #systemd.services."autovt@tty1".enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #Garbage colector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  system.autoUpgrade = {
   enable = true;
   channel = "https://nixos.org/channels/nixos-23.05";
  };
 
  system.stateVersion = "23.05";
  
  #Flakes
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
 };
}