{
  pkgs,
  lib,
  ...
}:

{
  documentation.dev.enable = true;

  # enable zsh autocompletion for system packages (systemd, etc)
  environment.pathsToLink = ["/share/zsh"];

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };
  console.keyMap = "fr";
  
  # graphics drivers / HW accel
#  hardware.opengl.enable = true;
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # enable programs
  programs = {
    less.enable = true;

    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting = {
        enable = true;
        patterns = {"rm -rf *" = "fg=black,bg=red";};
        styles = {"alias" = "fg=magenta";};
        highlighters = ["main" "brackets" "pattern"];
      };
    };
  };

  services.udev.packages = [ 
    pkgs.platformio-core
    pkgs.openocd
  ];

  # don't ask for password for wheel group
  security.sudo.wheelNeedsPassword = false;

  time.timeZone = lib.mkDefault "Europe/Paris";
  users.defaultUserShell = pkgs.zsh;
  users.users.corentin = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "docker" "wheel"];
  };
  
  system.autoUpgrade.enable = false;
  system.stateVersion = "23.05";

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    #package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
 };
 nixpkgs.config.allowUnfree = true;
}
