{ colorScheme }: {
  sway = import ./sway.nix colorScheme;
  kitty = import ./kitty.nix colorScheme.variant;
}