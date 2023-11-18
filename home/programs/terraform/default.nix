{
  config,
  pkgs,
  lib,
  terraform-providers,
  ...
}:
let
  esxi = pkgs.terraform-providers.mkProvider {
    homepage = "https://registry.terraform.io/providers/josenk/esxi";
    owner = "josenk";
    repo = "terraform-provider-esxi";
    rev = "v1.10.2";
    hash = "sha256-JI65fK7v/8NbgqaiZiAPbVGNYfUuJYgF0RwspluJvCI=";
    vendorHash = "sha256-8EIxqKkVO706oejlvN79K8aEZAF5H2vZRdr5vbQa0l4=";
  };
  terraform = pkgs.terraform.withPlugins (p: [
    p.random
    p.null
    p.aws
    terraform-providers.providers.hashicorp.vsphere
    esxi
  ]);
in {
  home.packages = [terraform];
}
