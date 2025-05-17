{ config, pkgs, user, ... }:

{
  environment.systemPackages = with pkgs; [
    libsForQt5.xwaylandvideobridge
    shikane
  ];
  
  systemd.user.services.xwaylandvideobridge = {
    enable = true;
    description = "Tool to make it easy to stream wayland windows and screens to existing applications running under Xwayland";
    wantedBy = ["graphical-session.target"];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.libsForQt5.xwaylandvideobridge}/bin/xwaylandvideobridge";
      Restart = "always";
    };
  };


  systemd.user.services.shikane = {
    enable = true;
    wantedBy = ["graphical-session.target"];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.shikane}/bin/shikane";
      Restart = "always";
    };
  };

}

