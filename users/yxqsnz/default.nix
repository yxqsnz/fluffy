{ pkgs, ... }: {
  programs.firefox.enable = true;
  home.packages = [ pkgs.foot  pkgs.pinentry pkgs.gh pkgs.iosevka ];

  imports = [
    ./custom/windowManager/sway.nix
    ./custom/windowManager/mako.nix
    ./custom/shell/fish
    ./custom/app/term/kitty.nix
    ./custom/app/dev/git.nix
  ];

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "curses";
  };
}
