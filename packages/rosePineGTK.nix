{ pkgs ? import <nixpkgs> { } }:
with pkgs; stdenv.mkDerivation {
  pname = "rosePineGTK";
  version = "2.0";
  src = fetchurl {
    url = "https://github.com/rose-pine/gtk/releases/download/v2.0.0/AllRosePineThemesGTK.tar.gz";
    sha256 = "5a7cb1c535adb28c9c7af4a983f66f84daa171a7a8ef4d8ebc846e203f6db42b";
  };

  propagatedUserEnvPkgs = [
    gnome.gnome-themes-extra
    gtk-engine-murrine
  ];

  installPhase = ''
    mkdir -p $out/share/themes
    mv -v * $out/share/themes/
  '';
}
