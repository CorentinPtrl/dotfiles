{self, ...}: {
  nixpkgs = {
    config.allowUnfree = true;
    config.permittedInsecurePackages = [
      "electron-25.9.0"
      "mono-4.8.1.0"
    ];
    config.nvidia.acceptLicense = true;
    overlays = [
      (final: prev: {
        lib =
          prev.lib
          // {
            colors = import "${self}/lib/colors" prev.lib;
          };
      })
    ];
  };
}
