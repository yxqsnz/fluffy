{ pkgs, ... }:
let custom = import ../../../../custom;
in with custom.theme.sway; {
  wayland.windowManager.sway = {
    enable = true;
    config = {
      inherit fonts colors gaps;
      terminal = "${pkgs.kitty}/bin/kitty";

      input = {
        "type:keyboard" = {
          xkb_layout = "br";
          xkb_options = "grp:alt_caps_toggle";
          xkb_numlock = "enabled";
          repeat_rate = "50";
          repeat_delay = "300";
        };

        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
          scroll_method = "two_finger";
        };
      };
    };

    extraSessionCommands = ''
      export XDG_SESSION_TYPE=wayland
      export XDG_SESSION_DESKTOP=sway
      export XDG_CURRENT_DESKTOP=sway
      export MOZ_ENABLE_WAYLAND=1
      export CLUTTER_BACKEND=wayland
      export QT_QPA_PLATFORM=wayland-egl
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
      export ECORE_EVAS_ENGINE=wayland-egl
      export ELM_ENGINE=wayland_egl
      export _JAVA_AWT_WM_NONREPARENTING=1
      export NO_AT_BRIDGE=1 
    '';

  };
}
