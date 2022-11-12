{ lib, user, pkgs, home-manager }: {
  mkHost = { nixpkgs, hostName, autologinUser, system, users, jobs, configuration }:
    let
      systemUsers = (map user.mkSystemUser users);
    in
    lib.nixosSystem {
      system = system;

      modules = [
        configuration
        ./persist.nix

        {
          imports = systemUsers;
        }

        {
          services.getty.autologinUser = autologinUser;
        }

        {
          networking.hostName = hostName;
        }

        {
          nix.settings = {
            max-jobs = lib.mkDefault jobs;
            experimental-features = [ "nix-command" "flakes" ];
          };
        }

        # Fix Nix channel
        {
          nixpkgs.pkgs = pkgs;
          environment.etc = {
            "nix/channels/nixpkgs".source = nixpkgs.outPath;
            "nix/channels/home-manager".source = home-manager.outPath;
          };

          nix.nixPath = [
            "nixpkgs=/etc/nix/channels/nixpkgs"
            "home-manager=/etc/nix/channels/home-manager"
          ];
        }
      ];
    };
}
