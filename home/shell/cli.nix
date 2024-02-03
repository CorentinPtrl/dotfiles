{ config, pkgs, user, ... }:

{
  home.packages = with pkgs; [
    # archives
    zip
    rar
    p7zip
    
    # utils
    file
    du-dust
    duf
    fd
    jq
    ripgrep
    upower
    speedtest-cli
    nmap
    progress

    #tops
    htop
    btop
 
    # file managers
    (ranger.overrideAttrs (r: {
  preConfigure = r.preConfigure + ''
    # Specify path to Überzug
    substituteInPlace ranger/ext/img_display.py \
      --replace "Popen(['ueberzug'" \
                "Popen(['${pkgs.ueberzug}/bin/ueberzug'"

    # Use Überzug as the default method
    substituteInPlace ranger/config/rc.conf \
      --replace 'set preview_images_method w3m' \
                'set preview_images_method kitty'
  '';
}))
    
    eza
  ];
}
