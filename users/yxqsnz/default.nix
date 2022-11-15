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

    # Chat
    pkgs.discord-canary

    # Util
    pkgs.wf-recorder
    pkgs.ffmpeg
    pkgs.wl-clipboard
    pkgs.p7zip


    # Rust Stuff
    pkgs.ripgrep
    pkgs.gnumake
    pkgs.fd
    pkgs.mold
    pkgs.rustup

    # Coding Stuff 
    pkgs.nixpkgs-fmt
    pkgs.vscode
    pkgs.distrobox
    pkgs.podman-compose
    pkgs.pinentry
    pkgs.gh

    # Cli tools
    pkgs.duf
    pkgs.yt-dlp

    # Gaming
    pkgs.mangohud
    pkgs.steam

    # Fonts
    pkgs.iosevka
    pkgs.noto-fonts
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
    ./custom/app/web/firefox.nix
    ./custom/app/term/kitty.nix
    ./custom/app/dev/git.nix
  ];

  gtk = custom.theme.gtk { variant = custom.colorScheme.variant; inherit pkgs; };
  programs.gpg.enable = true;
  fonts.fontconfig.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "curses";
  };
}
