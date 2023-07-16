{ config, lib, pkgs, ... }:

{
  #imports = [ 
  #  ./hyprland-environment.nix
  #];

  home.packages = with pkgs; [ 
    waybar
    swww
  ];

    home = {
    sessionVariables = {
      EDITOR = "gedit";
      BROWSER = "opera";
      TERMINAL = "cool-retro-term";
      __GL_VRR_ALLOWED="1";
      WLR_NO_HARDWARE_CURSORS = "1";
      WLR_RENDERER_ALLOW_SOFTWARE = "1";
      CLUTTER_BACKEND = "wayland";
      WLR_RENDERER = "vulkan";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
    };

    };
  
  #test later systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    nvidiaPatches = true;
    extraConfig = ''

    # Monitor
    monitor=DP-1,1920x1080@165,auto,1

    # Fix slow startup
    exec systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    exec dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP 

    # Autostart

    exec-once = hyprctl setcursor Bibata-Modern-Classic 24

    exec = pkill waybar & sleep 0.5 && waybar
    exec-once = swww init && swww img /home/corentin/Imagens/wallpapers/menhera.jpg

    # Set en layout at startup

    # Input config
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


    general {

        gaps_in = 5
        gaps_out = 20
        border_size = 2
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)

        layout = dwindle
    }

    decoration {

        rounding = 10
        blur = true
        blur_size = 3
        blur_passes = 1
        blur_new_optimizations = true

        drop_shadow = true
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)
    }

    animations {
        enabled = yes

        bezier = ease,0.4,0.02,0.21,1

        animation = windows, 1, 3.5, ease, slide
        animation = windowsOut, 1, 3.5, ease, slide
        animation = border, 1, 6, default
        animation = fade, 1, 3, ease
        animation = workspaces, 1, 3.5, ease
    }

    dwindle {
        pseudotile = yes
        preserve_split = yes
    }

    master {
        new_is_master = yes
    }

    gestures {
        workspace_swipe = false
    }

    # Example windowrule v1
    # windowrule = float, ^(kitty)$
    # Example windowrule v2
    # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

    windowrule=float,^(kitty)$
    windowrule=float,^(pavucontrol)$
    windowrule=center,^(kitty)$
    windowrule=float,^(blueman-manager)$
    windowrule=size 1040 670,^(kitty)$
    windowrule=size 934 525,^(mpv)$
    windowrule=float,^(mpv)$
    windowrule=center,^(mpv)$
    #windowrule=pin,^(firefox)$

    $mainMod = CTRL
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


    bindle=,XF86MonBrightnessUp,exec,~/.config/hypr/scripts/brightness up  # increase screen brightness
    bindle=,XF86MonBrightnessDown,exec,~/.config/hypr/scripts/brightness down # decrease screen brightnes



    bind=$mainModSHIFT,E,exec,wlogout
    bind =CTRL, T, togglefloating,
    bind=$mainModSHIFT,P,exec,pomotroid --in-process-gpu
    
    # Functional keybinds
    bind =,XF86AudioMicMute,exec,pamixer --default-source -t
    bind =,XF86MonBrightnessDown,exec,light -U 20
    bind =,XF86MonBrightnessUp,exec,light -A 20
    bind =,XF86AudioMute,exec,pamixer -t
    bind =,XF86AudioLowerVolume,exec,pamixer -d 10
    bind =,XF86AudioRaiseVolume,exec,pamixer -i 10
    bind =,XF86AudioPlay,exec,playerctl play-pause
    bind =,XF86AudioPause,exec,playerctl play-pause

    # Screen shot
    bind=ALT,R,exec,grim -g "$(slurp)" - | wl-copy
    # Screen recorder
    bind=$mainModALT,R,exec,wf-recorder -g "$(slurp)"
    # Emoji selector
    #bind=$mainMod,E,exec,rofi -modi emoji -show emoji

    # to switch between windows in a floating workspace
    bind = SUPER,Tab,cyclenext,
    bind = SUPER,Tab,bringactivetotop,

    # Move focus with mainMod + arrow keys
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    # Switch workspaces with mainMod + [0-9]
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

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
    bindm = ALT, mouse:272, resizewindow
        '';
  };
}
