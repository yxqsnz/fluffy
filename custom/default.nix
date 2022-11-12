rec {
  themeName = "rosePine";
  colorSchemeName = "rosePineDark";
  
  colorScheme = import ./colorSchemes/${colorSchemeName}.nix;
  theme = import ./themes/${themeName} { inherit colorScheme; };
}