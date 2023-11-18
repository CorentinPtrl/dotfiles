{ config, pkgs, user, ... }:

{
  home.packages = (with pkgs; [
    gnumake
    (ansible.override { windowsSupport = true; })
    vmware-workstation
    packer
    ktlint
    gradle
    arduino
    postgresql_14 
    minio-client 
    rustup 
    gcc
    gnumake
  ]);
}
