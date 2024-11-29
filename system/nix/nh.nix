{inputs, ...}: {
  # nh default flake
  environment.variables.FLAKE = "/home/corentin/Dev/nixland";

#  programs.nh = {
#    enable = true;
    # weekly cleanup
#    clean = {
#      enable = true;
#      extraArgs = "--keep-since 7d";
#    };
#  };
}
