{ pkgs, lib, config, ... }:
let
  custom = import ../../../../../custom;
  input = import ./input.nix;
  extraSessionCommands = import ./extraSessionCommands.nix;
  keybindings = import ./keybindings.nix {
    inherit pkgs config;
  };
  customSway = custom.theme.sway { inherit pkgs; colorScheme = custom.colorScheme; };
in
with customSway; {
  wayland.windowManager.sway = {
    enable = true;
    config = {
      inherit fonts colors gaps input keybindings bars;
      terminal = "${pkgs.kitty}/bin/kitty";

      modifier = "Mod4";
      menu = "${pkgs.wofi}/bin/wofi --show drun -p \"\" -I -m";
    };

    wrapperFeatures.gtk = true;
    extraSessionCommands = extraSessionCommands;
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      { timeout = 300; command = "${pkgs.swaylock-effects}/bin/swaylock-effects -fF"; }
      {
        timeout = 600;
        command = "swaymsg 'output * dpms off'";
        resumeCommand = "swaymsg 'output * dpms on'";
      }
      {
        timeout = 1200;
        command = "systemctl suspend";
        resumeCommand = "swaymsg 'output * dpms on'";
      }
    ];
  };

  programs = lib.mergeAttrs customSway.extraPrograms {
    swaylock = {
      settings = {
        color = "808080";
        font-size = 24;
        indicator-idle-visible = false;
        indicator-radius = 100;
        line-color = "ffffff";
        show-failed-attempts = true;
      };
    };
  };
}
