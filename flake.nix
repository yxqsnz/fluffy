{
  description = "My System Config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-doom-emacs }:
    let
      yxqsnzOverlay = import ./overlay/yxqsnz.nix;
      customPackagesOverlay = import ./overlay/customPackages.nix;

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
        overlays = [ yxqsnzOverlay customPackagesOverlay ];
      };

      inherit (nixpkgs) lib;

      util = import ./lib {
        inherit pkgs home-manager lib;
      };

      inherit (util) host user;
    in
    {
      homeConfigurations = {
        yxqsnz = user.mkHomeManagerUser "yxqsnz" [ nix-doom-emacs.hmModule ];
      };

      nixosConfigurations = {
        fluffy = host.mkHost {
          inherit nixpkgs;
          system = "x86_64-linux";
          hostName = "fluffy";
          jobs = 12;
          configuration = ./hosts/fluffy;
          autologinUser = "yxqsnz";
          users = [{
            name = "yxqsnz";
            description = "Yxqsnz";
            groups = [ "system-config" "wheel" "networkmanager" ];
            uid = 1000;
            shell = pkgs.fish;
          }];
        };
      };
    };
}
