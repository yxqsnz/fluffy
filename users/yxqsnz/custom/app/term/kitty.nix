let custom = import ../../../../../custom;
in with custom.theme; {
  programs.kitty = {
    enable = true;
    theme = kitty.theme.name;
  };
}