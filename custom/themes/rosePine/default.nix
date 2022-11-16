{ colorScheme }: {
  sway = import ./sway.nix;
  kitty = import ./kitty.nix colorScheme.variant;
  gtk = import ./gtk.nix;
}
