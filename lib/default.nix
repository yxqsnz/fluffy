{ pkgs, lib, home-manager }: rec {
  host = import ./host.nix {
    inherit pkgs home-manager lib user;
  };

  user = import ./user.nix {
    inherit pkgs home-manager;
  };
}
