{ inputs ,config, pkgs, lib, ...}: {
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "foot";
    "$browser" = "chromium";
    "$menu" = "rofi";
    "$screen" = "grim";
    xwayland = {
      force_zero_scaling = true;
    };
    monitor = [", preferred, auto, auto"];
    exec-once = ["waybar" "$terminal" "swww img ~/Pictures/wallpapers/ign_robots.png"];
    bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
    ];
    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 1;
      "col.inactive_border" = "rgba(000000aa)";
      "col.active_border" = "rgba(c0c8d8aa)";
      resize_on_border = true;
      allow_tearing = false;
      layout = "dwindle";
    };

    decoration = {
      rounding = 10;
      active_opacity = 1.0;
      inactive_opacity = 1.0;
    };

    master = {
      new_status = "master";
    };

    input = {
      kb_layout = "us";
      kb_variant = "";
      kb_options = "";
      kb_rules = "";
      follow_mouse = 1;
      sensitivity = 0;

      touchpad = {
        natural_scroll = true;
      };
    };
    
    animations = {
      enabled = true;
      bezier = [
        "easeOutQuint, 0.23, 1, 0.32, 1"
        "easeInOutCubic,0.65,0.05,0.36,1"
        "linear,0,0,1,1"
        "almostLinear,0.5,0.5,0.75,1.0"
        "quick,0.15,0,0.1,1"
      ];

      animation = [
       "global, 1, 10, default"
       "border, 1, 5.39, easeOutQuint"
       "windows, 1, 4.79, easeOutQuint"
       "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
       "windowsOut, 1, 1.49, linear, popin 87%"
       "fadeIn, 1, 1.73, almostLinear"
       "fadeOut, 1, 1.46, almostLinear"
       "fade, 1, 3.03, quick"
       "layers, 1, 3.81, easeOutQuint"
       "layersIn, 1, 4, easeOutQuint, fade"
       "layersOut, 1, 1.5, linear, fade"
       "fadeLayersIn, 1, 1.79, almostLinear"
       "fadeLayersOut, 1, 1.39, almostLinear"
       "workspaces, 1, 1.94, almostLinear, fade"
       "workspacesIn, 1, 1.21, almostLinear, fade"
       "workspacesOut, 1, 1.94, almostLinear, fade"
      ];
    };

    bind = [
      "SUPER, Return, exec, foot"
      "SUPER, Q, killactive"
      "SUPER, E, exec, pcmanfm"
      "SUPER, V, togglefloating"
      "SUPER, P, exec, rofi -show drun"
      "SUPER, I, togglesplit"
      "SUPER, F, fullscreen"
      "SUPER, W, exec, chromium"
      "SUPER Shift, G, exec, grim"

      "SUPER, h, movefocus, l"
      "SUPER, l, movefocus, r"
      "SUPER, k, movefocus, u"
      "SUPER, j, movefocus, d"

      "SUPER SHIFT, h, movewindow, l"
      "SUPER SHIFT, l, movewindow, r"
      "SUPER SHIFT, k, movewindow, u"
      "SUPER SHIFT, j, movewindow, d"

      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"

      "SUPER SHIFT, 1, movetoworkspace, 1"
      "SUPER SHIFT, 2, movetoworkspace, 2"
      "SUPER SHIFT, 3, movetoworkspace, 3"
      "SUPER SHIFT, 4, movetoworkspace, 4"
      "SUPER SHIFT, 5, movetoworkspace, 5"

      "SUPER, right, resizeactive, 10 0"
      "SUPER, left, resizeactive, -10 0"
      "SUPER, up, resizeactive, 0 -10"
      "SUPER, down, resizeactive, 0 10"
    ];
  };
}
