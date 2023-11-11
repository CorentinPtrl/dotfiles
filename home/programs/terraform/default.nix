{
  config,
  pkgs,
  lib,
  terraform-providers,
  ...
}:
let
  terraform = pkgs.terraform.withPlugins (p: [
    p.random
    p.null
    p.aws
    terraform-providers.providers.hashicorp.vsphere
  ]);
in {
  home.packages = [terraform];
}
