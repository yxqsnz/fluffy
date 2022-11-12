{ pkgs, ... }:
let custom = import ../../custom;
in {
  programs.firefox.enable = true;
  home.packages = [
    pkgs.foot
    pkgs.pinentry
    pkgs.gh
    pkgs.iosevka
    pkgs.wf-recorder
    pkgs.ffmpeg
    pkgs.discord-canary
    (pkgs.nerdfonts.override { fonts = [ "Iosevka" ]; })
  ];

  imports = [
    ./custom/windowManager/sway.nix
    ./custom/windowManager/mako.nix
    ./custom/shell/fish
    ./custom/app/term/kitty.nix
    ./custom/app/dev/git.nix
  ];

  gtk = custom.theme.gtk;
  programs.gpg.enable = true;
  fonts.fontconfig.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "curses";
  };
}
