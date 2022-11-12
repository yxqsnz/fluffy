{
  description = "My System Config";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      yxqsnzOverlay = import ./overlay/yxqsnz.nix;
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
        overlays = [ yxqsnzOverlay ];
      };

      inherit (nixpkgs) lib;

      util = import ./lib {
        inherit pkgs home-manager lib;
      };

      inherit (util) host user;
    in
    {
      homeConfigurations = {
        yxqsnz = user.mkHomeManagerUser "yxqsnz";
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
