{ pkgs, config, ... }:
let
  custom = import ../../../../../custom;
  input = import ./input.nix;
  extraSessionCommands = import ./extraSessionCommands.nix;
  keybindings = import ./keybindings.nix {
    inherit pkgs config;
  };
in
with custom.theme.sway; {
  wayland.windowManager.sway = {
    enable = true;
    config = {
      inherit fonts colors gaps input keybindings;
      terminal = "${pkgs.kitty}/bin/kitty";

      modifier = "Mod4";
      menu = "${pkgs.wofi}/bin/wofi --show drun -p \"\" -I -m";
    };

    wrapperFeatures.gtk = true;
    extraSessionCommands = extraSessionCommands;
  };
}
