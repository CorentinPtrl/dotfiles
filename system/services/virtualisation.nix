{ config, pkgs, user, ... }:

{
  virtualisation = {
    docker.enable = true;
    vmware.host.enable = true; 
 };

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}

