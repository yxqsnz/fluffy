let custom = import ../../../../../custom;
in with custom.theme.kitty; {
  programs.kitty = {
    enable = true;
    inherit theme font;
  };
}
