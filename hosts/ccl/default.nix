{
  pkgs,
  config,
  ...
}: {
  imports = [./hardware-configuration.nix];

  networking.hostName = "nix-corentin-ccl";
  networking.firewall.enable = false;
  services = {
    # for SSD/NVME
    fstrim.enable = true;
  };
  services.logind.lidSwitch = "ignore";

}
