{lib, ...}:
# networking configuration
{
  environment.etc = {
    "resolv.conf".text = "nameserver 1.1.1.1\nnameserver 1.0.0.1";
  };
  networking.networkmanager = {
    enable = true;
  };
networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];

  # Don't wait for network startup
#  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
}
