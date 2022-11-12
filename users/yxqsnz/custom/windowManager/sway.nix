{ pkgs, ... }: 
let custom = import ../../../../custom;
in with custom.theme.sway; {
  wayland.windowManager.sway = {
    enable = true;
    config = {
      colors = colors;
      gaps = gaps; 
    };
  };
}