let desktop = [
  ./core/boot.nix
  ./core/default.nix

  ./hardware/opengl.nix
  ./hardware/bluetooth.nix
  
  ./network/default.nix

  ./programs

  ./services
  ./services/platformio.nix
  ./services/virtualisation.nix
  ./services/greetd.nix
  ./services/pipewire.nix
  ./services/flatpak.nix
  ./services/xwaylandvideobridge.nix
];
in {
  inherit desktop;
}
