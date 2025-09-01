{ config, pkgs, user, inputs,... }:

let
  unstable = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixpkgs-unstable.tar.gz";
  }) {};
in
{
  home.packages = with pkgs; [
    gnumake
    (ansible.override { windowsSupport = true; })
    #vmware-workstation
    packer
    ktlint
    gradle
    arduino
    postgresql_14 
    minio-client 
    rustup 
    gcc
    gnumake
    go
    platformio
    csfml
    jetbrains-toolbox 
    dotnet-sdk_8
    mono
    mono4
    awscli2
    xorriso
    terraform    
    sshpass
    kubectl
    vscode
    terragrunt
    unityhub
    sops
    kubernetes-helm
    spotify
    notion-app-enhanced
    openvpn
    operator-sdk
    inetutils
    mysql80
    sameboy
    unstable.deskflow
    kubectl-neat
    icu.dev
    jdk21
    dolphin-emu
    openstackclient-full
    cilium-cli
    lan-mouse
  ];
}
