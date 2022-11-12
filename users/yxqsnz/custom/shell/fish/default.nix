{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ./config.fish;
    shellAliases = {
      ls = "${pkgs.exa}/bin/exa --icons";
    };
    shellAbbrs = {
      g = "git";
      duhf = "duf --hide special";
      gcm = "git commit -m";
      gce = "git commit";
      gah = "git add .";
      gp = "git push";
      gd = "git diff";
      nsh = "nix shell";
    };
  };

  programs.command-not-found.enable = false;
}
