{ config, pkgs, user, ... }:

{
  virtualisation = {
    docker.enable = true;
  };

  users.groups.docker.members = [ "corentin" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
