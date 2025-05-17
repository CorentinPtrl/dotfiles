{pkgs, ...}: {
  # graphics drivers / HW accel
  hardware.opengl = {
    enable = true;
#    enable32Bit = true;
#    driSupport = true; # This is already enabled by default
    driSupport32Bit = true; # For 32 bit applications    
#driSupport32Bit = true;

    extraPackages = with pkgs; [
      libva
      vaapiVdpau
      libvdpau-va-gl
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
