{ config, pkgs, user, ... }:

{
  virtualisation = {
    docker.enable = true;
    vmware.host.enable = true; 
 };

  users.groups.docker.members = [ "corentin" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
