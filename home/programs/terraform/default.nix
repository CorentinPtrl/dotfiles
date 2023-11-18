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
    terraform-providers.providers.josenk.esxi
  ]);
in {
  home.packages = [terraform];
}
