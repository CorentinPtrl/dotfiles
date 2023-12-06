{ config, lib, pkgs, ... }: let
  hyprctl = "${pkgs.hyprland}/bin/hyprctl";
  loginctl = "${pkgs.systemd}/bin/loginctl";

in {

  home.packages = with pkgs; [ 
    swww
    playerctl
    brightnessctl
  ];

  home = {
    sessionVariables = {
      EDITOR = "nano";
      BROWSER = "brave";
      TERMINAL = "kitty";
      __GL_VRR_ALLOWED="1";
      WLR_NO_HARDWARE_CURSORS = "1";
      WLR_RENDERER_ALLOW_SOFTWARE = "1";
      CLUTTER_BACKEND = "wayland";
      WLR_RENDERER = "vulkan";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      NIXOS_OZONE_WL = "1";
    };
  };

  services.swayidle = {
      enable = false;
      systemdTarget = "graphical-session.target";

      events = [
        {
          event = "lock";
          command = "${config.programs.swaylock.package}/bin/swaylock";
        }
      ];

      timeouts = [
        {
          timeout = 5 * 60;
          command = "${hyprctl} dispatch dpms off";
        }
        {
          timeout = 15 * 60;
          command = "${loginctl} lock-session";
        }
    ];
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
#      screenshots = true;
      clock = true;
      indicator = true;
      indicator-radius = 100;
      indicator-thickness = 7;
      effect-blur = "7x5";
    };
  };

  #test later systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''

   <########################################################################################
 __  __ _       _                 _ 
|  \/  (_)_ __ (_)_ __ ___   __ _| |
| |\/| | | '_ \| | '_ ` _ \ / _` | |
| |  | | | | | | | | | | | | (_| | |
|_|  |_|_|_| |_|_|_| |_| |_|\__,_|_|
                                    
 _   _                  _                 _    ____             __ _           
| | | |_   _ _ __  _ __| | __ _ _ __   __| |  / ___|___  _ __  / _(_) __ _ ___ 
| |_| | | | | '_ \| '__| |/ _` | '_ \ / _` | | |   / _ \| '_ \| |_| |/ _` / __|
|  _  | |_| | |_) | |  | | (_| | | | | (_| | | |__| (_) | | | |  _| | (_| \__ \
|_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|  \____\___/|_| |_|_| |_|\__, |___/
       |___/|_|                                                      |___/    
#########################################################################################


$mainMod=CTRL
monitor=HDMI-A-1,1920x1080@60,0x0,1
monitor=DP-2,1920x1080@60,1920x0,1
monitor=,preferred,auto,1

#Xdg desktop
exec-once=~/script/start-xdg-desktop.sh
# Status bar :) 
exec-once=waybar
#Notification 
exec-once=dunst
# Wallpaper
exec-once=swww-daemon init && pkill dynamic_wallpap && dynamic_wallpaper
# For screen sharing 
exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
# For keyboard 
exec-once=fcitx5 -D
# For lockscreen
exec-once=swayidle -w timeout 2000 'swaylock' before-sleep 'swaylock -f'
# Start Page
exec-once=~/.config/hypr/scripts/startpage.sh

#Auth agent
exec-once=${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 

# Bluetooth
exec-once=blueman-applet # Make sure you have installed blueman

#Auto Start
exec-once=discord
exec-once=jetbrains-toolbox --minimize
# Screen Sharing 
exec-once=systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
exec-once=~/.config/hypr/scripts/screensharing.sh


input {
  kb_layout=fr
  #Remap Capslock -> Esc for Vim users  
  #kb_options=caps:escape 
  repeat_rate=50
  repeat_delay=240

  touchpad {
    disable_while_typing=1
    natural_scroll=1
    #clickfinger_behavior=1
    middle_button_emulation=0
    tap-to-click=1
  }
}


gestures { 
  workspace_swipe=true 
  workspace_swipe_min_speed_to_force=5
}

misc {
  disable_hyprland_logo=true
  disable_splash_rendering=true
  mouse_move_enables_dpms=true
  #no_vfr=1
}

########################################################################################

\ \        / (_)         | |                   |  __ \     | |          
  \ \  /\  / / _ _ __   __| | _____      _____  | |__) |   _| | ___  ___ 
   \ \/  \/ / | | '_ \ / _` |/ _ \ \ /\ / / __| |  _  / | | | |/ _ \/ __|
    \  /\  /  | | | | | (_| | (_) \ V  V /\__ \ | | \ \ |_| | |  __/\__ \
     \/  \/   |_|_| |_|\__,_|\___/ \_/\_/ |___/ |_|  \_\__,_|_|\___||___/

########################################################################################


# Float Necessary Windows
windowrule=float,Rofi
windowrule=float,pavucontrol
windowrulev2 = float,class:^()$,title:^(Picture in picture)$
windowrulev2 = float,class:^(brave)$,title:^(Save File)$
windowrulev2 = float,class:^(brave)$,title:^(Open File)$
windowrulev2 = float,class:^(LibreWolf)$,title:^(Picture-in-Picture)$
windowrulev2 = float,class:^(blueman-manager)$

# Increase the opacity 
windowrule=opacity 0.92,Thunar
windowrule=opacity 0.96,discord
windowrule=opacity 0.9,VSCodium
windowrule=opacity 0.88,obsidian
windowrulev2=opacity 0.96,class:^(notion-nativefier-46aee8)$
windowrulev2=opacity 0.80,class:^(Spotify)$
^.*nvim.*$
windowrule=tile,librewolf
windowrule=tile,spotify
windowrule=opacity 1,neovim
bindm=ALT,mouse:272,movewindow
bindm=ALT,mouse:273,resizewindow


###########################################
  ____  _           _ _                 
 |  _ \(_)         | (_)                
 | |_) |_ _ __   __| |_ _ __   __ _ ___ 
 |  _ <| | '_ \ / _` | | '_ \ / _` / __|
 | |_) | | | | | (_| | | | | | (_| \__ \
 |____/|_|_| |_|\__,_|_|_| |_|\__, |___/
                               __/ |    
                              |___/     

###########################################

# example binds
bind=$mainMod,E,killactive
bind=$mainMod,B,exec,librewolf
#bind=$mainMod,F,fullscreen,1
bind=$mainModSHIFT,F,fullscreen,0
bind=$mainMod,RETURN,exec,kitty
bind=SUPER,C,killactive,
#bind=$mainModSHIFT,Q,exit,
#bind=$mainMod,E,exec,pcmanfm
bind=$mainModSHIFT,D,exec, rofi -show drun
bind=$mainMod,P,pseudo,
bind=$mainMod,ESCAPE,exec,sudo systemctl suspend

bind =,XF86AudioMicMute,exec,pamixer --default-source -t

#Brightness
bind =,XF86MonBrightnessDown,exec,brightnessctl set 1%-
bind =,XF86MonBrightnessUp,exec,brightnessctl set 1%+

#Audio
bind =,XF86AudioMute,exec,pamixer -t
bind =,XF86AudioLowerVolume,exec,pamixer -d 10
bind =,XF86AudioRaiseVolume,exec,pamixer -i 10

#Media
bind =,XF86AudioPlay,exec,playerctl play-pause
bind =,XF86AudioNext,exec,playerctl next
bind =,XF86AudioPrev,exec,playerctl previous

#bind=$mainModSHIFT,C,exec,bash ~/.config/hypr/scripts/hyprPicker.sh
bind=$mainModSHIFT,E,exec,wlogout
bind =CTRL, T, togglefloating,
bind=$mainModSHIFT,P,exec,pomotroid --in-process-gpu

# Screen shot 
bind=ALT,R,exec,grim -g "$(slurp)" - | wl-copy
# Screen recorder
bind=$mainModALT,R,exec,wf-recorder -g "$(slurp)"
# Emoji selector 
#bind=$mainMod,E,exec,rofi -modi emoji -show emoji


bind=$mainModSHIFT,RETURN,layoutmsg,swapwithmaster
bind=$mainMod,j,layoutmsg,cyclenext
bind=$mainMod,k,layoutmsg,cycleprev

bind=$mainMod,h,movefocus,l
bind=$mainMod,l,movefocus,r

bind=ALT,left,resizeactive,-40 0
bind=ALT,right,resizeactive,40 0

bind=ALT,up,resizeactive,0 -40
bind=ALT,down,resizeactive,0 40

bind=$mainModSHIFT,h,movewindow,l
bind=$mainModSHIFT,l,movewindow,r
bind=$mainModSHIFT,k,movewindow,u
bind=$mainModSHIFT,j,movewindow,d

bind=$mainMod,ampersand,workspace,1
bind=$mainMod,eacute,workspace,2
bind=$mainMod,quotedbl,workspace,3
bind=$mainMod,apostrophe,workspace,4
bind=$mainMod,parenleft,workspace,5
bind=$mainMod,minus,workspace,6
bind=$mainMod,egrave,workspace,7
bind=$mainMod,underscore,workspace,8
bind=$mainMod,ccedilla,workspace,9
bind=$mainMod,agrave,workspace,10

bind=$mainModSHIFT,ampersand,movetoworkspacesilent,1
bind=$mainModSHIFT,eacute,movetoworkspacesilent,2
bind=$mainModSHIFT,quotedbl,movetoworkspacesilent,3
bind=$mainModSHIFT,apostrophe,movetoworkspacesilent,4
bind=$mainModSHIFT,parenleft,movetoworkspacesilent,5
bind=$mainModSHIFT,minus,movetoworkspacesilent,6
bind=$mainModSHIFT,egrave,movetoworkspacesilent,7
bind=$mainModSHIFT,underscore,movetoworkspacesilent,8
bind=$mainModSHIFT,ccedilla,movetoworkspacesilent,9
bind=$mainModSHIFT,agrave,movetoworkspacesilent,10

$THEME=iamverysimple

$THEME_DIR=$HOME/.config/hypr/themes/iamverysimple

# Status bar :) 
#exec=killall -3 eww & sleep 1 && $HOME/.config/eww/launch_bar
exec = pkill waybar & sleep 0.5 && waybar
#Notification 
exec-once=dunst
# Wallpaper
exec=pkill -9 swwwpaper ; "$HOME"/.config/swww/swwwpaper "$HOME"/.config/swww/wallpapers
exec=pkill -9 swwwpaper ; dynamic_wallpaper
exec-once=swayidle -w timeout 200 'swaylock-fancy'

general {
    layout=dwindle
    sensitivity=1.0 # for mouse cursor

    gaps_in=5
    gaps_out=20
    border_size=2
    col.active_border=0xff5e81ac
    col.inactive_border=0x66333333
    apply_sens_to_raw=0 # whether to apply the sensitivity to raw input (e.g. used by>
}

decoration {
    rounding=13
    #blur=1
    #blur_size=6.8 # minimum 1
    #blur_passes=2 # minimum 1, more passes = more resource intensive.
    #blur_new_optimizations = true
    # Your blur "amount" is blur_size * blur_passes, but high blur_size (over around >
    # if you want heavy blur, you need to up the blur_passes.
    # the more passes, the more you can up the blur_size without noticing artifacts.
}

# Blur for waybar
blurls=waybar

animations {
    enabled=1
    # bezier=overshot,0.05,0.9,0.1,1.1
    bezier=overshot,0.13,0.99,0.29,1.1
    animation=windows,1,5,overshot,popin
    animation=fade,1,10,default
    animation=workspaces,1,6.5,overshot,slide
    animation=border,1,10,default
}

dwindle {
    pseudotile=1 # enable pseudotiling on dwindle
    force_split=2
}

master {
  new_on_top=true
  no_gaps_when_only = true
}

misc {
  disable_hyprland_logo=true
  disable_splash_rendering=true
  mouse_move_enables_dpms=true
  #no_vfr=1
}
'';
  };
}
