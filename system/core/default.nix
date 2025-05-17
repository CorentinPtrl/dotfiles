{lib, pkgs, ...}:
# default configuration shared by all hosts
{
  imports = [
    ./security.nix
    ./users.nix
    ../nix
    ../programs/zsh.nix
  ];

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  environment.systemPackages = with pkgs; [
    go
  ];

  # don't touch this
  system.stateVersion = lib.mkDefault "24.11";
  time.timeZone = lib.mkDefault "Europe/Paris";

  programs.nix-ld.enable = true;
  # compresses half the ram for use as swap
  zramSwap.enable = true;
}
