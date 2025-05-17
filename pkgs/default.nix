{
  systems = ["x86_64-linux"];

  perSystem = {pkgs, ...}: {
    packages = {

      phocus = pkgs.callPackage ./phocus {};

      # instant repl with automatic flake loading
      repl = pkgs.callPackage ./repl {};

      hyper = pkgs.callPackage ./hyper {};
      
      deskflow = pkgs.callPackage ./deskflow {};
    };
  };
}
