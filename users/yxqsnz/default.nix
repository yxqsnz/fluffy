{ pkgs, ... }:
let
  custom = import ../../custom;
  ccStdenv = with pkgs.llvmPackages_14; [
    stdenv
    llvm
    clang
    pkgs.clang-tools
    libcxx
    libcxxabi
  ];
in
{
  programs.firefox.enable = true;

  home.packages = [
    pkgs.pinentry
    pkgs.gh
    pkgs.iosevka
    pkgs.wf-recorder
    pkgs.ffmpeg
    pkgs.discord-canary
    pkgs.wl-clipboard
    pkgs.p7zip
    pkgs.distrobox
    pkgs.podman-compose
    pkgs.noto-fonts
    pkgs.mold
    pkgs.rustup
    pkgs.vscode
    pkgs.ripgrep
    pkgs.gnumake
    pkgs.fd
    pkgs.nixpkgs-fmt
    pkgs.noto-fonts-extra
    pkgs.noto-fonts-emoji
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-cjk-serif
    (pkgs.nerdfonts.override { fonts = [ "Iosevka" ]; })
  ] ++ ccStdenv;

  imports = [
    ./custom/windowManager/sway
    ./custom/windowManager/mako.nix
    ./custom/compiler/cargo.nix
    ./custom/editor/vscode.nix
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
