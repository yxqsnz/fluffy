with import ./fonts.nix;
{ pkgs, variant }: {
  enable = true;

  font = {
    name = normal.family;
    size = normal.size;
  };

  iconTheme = {
    package = pkgs.papirus-icon-theme;
    name = if variant == "dark" then "Papirus-Dark" else "Papirus";
  };

  theme = {
    package = pkgs.rosePineGTK;
    name = if variant == "dark" then "rose-pine-gtk" else "rose-pine-dawn-gtk";
  };
}
