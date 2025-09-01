{lib, ...}:
# networking configuration
{
  environment.etc = {
    "resolv.conf".text = "nameserver 100.100.100.100\nnameserver 1.1.1.1\nnameserver 192.168.1.254\nnameserver 8.8.8.8";
  };
  networking.networkmanager = {
    enable = true;
  };
networking.nameservers = [ "1.1.1.1" "9.9.9.9" "100.100.100.100" ];
  # Don't wait for network startup
#  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
}
