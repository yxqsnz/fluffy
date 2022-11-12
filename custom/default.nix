rec {
  themeName = "rosePine";
  colorSchemeName = "rosePineLight";

  colorScheme = import ./colorSchemes/${colorSchemeName}.nix;
  theme = import ./themes/${themeName} { inherit colorScheme; };
}
