with import ./fonts.nix;
variant: {
  font = {
    name = normal.family;
    size = normal.size;
  };

  theme = (if variant == "dark" then "Rosé Pine" else "Rosé Pine Dawn");
}
