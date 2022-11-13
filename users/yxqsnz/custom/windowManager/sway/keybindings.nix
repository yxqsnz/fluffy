{ pkgs, config }:
let
  mod = "Mod4";
  playerctl = "exec ${pkgs.playerctl}/bin/playerctl";
  brightnessctl = "exec ${pkgs.brightnessctl}/bin/brightnessctl";
  grimshot = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot";
  cfg = config.wayland.windowManager.sway;
  audio = "exec ${pkgs.pamixer}/bin/pamixer";
in
{
  XF86AudioRaiseVolume = "${audio} -i 5";
  XF86AudioLowerVolume = "${audio} -d 5";
  XF86AudioMute = "${audio} -t";
  XF86AudioMicMute = "${audio} mute-input";

  # Control media
  XF86AudioPlay = "${playerctl} play-pause";
  XF86AudioPause = "${playerctl} play-pause";
  XF86AudioNext = "${playerctl} next";
  XF86AudioPrev = "${playerctl} previous";
  # Control brightness
  XF86MonBrightnessUp = "${brightnessctl} set 10%+";
  XF86MonBrightnessDown = "${brightnessctl} set 10%-";

  Print = "${grimshot} --notify copy screen";
  "Shift+Print" = "${grimshot} --notify copy area";

  "${mod}+Return" = "exec ${cfg.config.terminal}";
  "${mod}+Shift+q" = "kill";
  "${mod}+d" = "exec ${cfg.config.menu}";

  "${mod}+${cfg.config.left}" = "focus left";
  "${mod}+${cfg.config.down}" = "focus down";
  "${mod}+${cfg.config.up}" = "focus up";
  "${mod}+${cfg.config.right}" = "focus right";

  "${mod}+Left" = "focus left";
  "${mod}+Down" = "focus down";
  "${mod}+Up" = "focus up";
  "${mod}+Right" = "focus right";

  "${mod}+Shift+${cfg.config.left}" = "move left";
  "${mod}+Shift+${cfg.config.down}" = "move down";
  "${mod}+Shift+${cfg.config.up}" = "move up";
  "${mod}+Shift+${cfg.config.right}" = "move right";

  "${mod}+Shift+Left" = "move left";
  "${mod}+Shift+Down" = "move down";
  "${mod}+Shift+Up" = "move up";
  "${mod}+Shift+Right" = "move right";

  "${mod}+b" = "splith";
  "${mod}+v" = "splitv";
  "${mod}+f" = "fullscreen toggle";
  "${mod}+a" = "focus parent";

  "${mod}+Shift+s" = "layout stacking";
  "${mod}+w" = "layout tabbed";
  "${mod}+e" = "layout toggle split";

  "${mod}+s" = "floating toggle";
  "Mod1+f" = "focus mode_toggle";

  "${mod}+1" = "workspace number 1";
  "${mod}+2" = "workspace number 2";
  "${mod}+3" = "workspace number 3";
  "${mod}+4" = "workspace number 4";
  "${mod}+5" = "workspace number 5";
  "${mod}+6" = "workspace number 6";
  "${mod}+7" = "workspace number 7";
  "${mod}+8" = "workspace number 8";
  "${mod}+9" = "workspace number 9";

  "${mod}+Shift+1" =
    "move container to workspace number 1";
  "${mod}+Shift+2" =
    "move container to workspace number 2";
  "${mod}+Shift+3" =
    "move container to workspace number 3";
  "${mod}+Shift+4" =
    "move container to workspace number 4";
  "${mod}+Shift+5" =
    "move container to workspace number 5";
  "${mod}+Shift+6" =
    "move container to workspace number 6";
  "${mod}+Shift+7" =
    "move container to workspace number 7";
  "${mod}+Shift+8" =
    "move container to workspace number 8";
  "${mod}+Shift+9" =
    "move container to workspace number 9";

  "${mod}+Shift+minus" = "move scratchpad";
  "${mod}+minus" = "scratchpad show";

  "${mod}+Shift+c" = "reload";
  "${mod}+Shift+e" =
    "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";

  "${mod}+r" = "mode resize";
}
