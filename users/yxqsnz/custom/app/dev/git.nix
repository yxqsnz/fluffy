{
  programs.git = {
    enable = true;
    userName = "yxqsnz";
    userEmail = "yxqsnz@gmail.com";
    signing = {
      key = "F7D3A543A08430B779E22A5D6086E6FD3357292B";
      signByDefault = true;
    };
    aliases = {
      plog =
        "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      root = "rev-parse --show-toplevel";
    };
    extraConfig = {
      safe = {
        directory = [ "/nix/config" ];
      };
      branch = {
        autosetuprebase = "always";
      };

      github = {
        user = "yxqsnz";
      };

      init = {
        defaultBranch = "dev";
      };

      core = {
        askPass = ""; # needs to be empty to use terminal for ask pass
        ui = true;
      };

      credential = {
        helper = "store"; # want to make this more secure
      };

      push = {
        default = "tracking";
        autoSetupRemote = true;
      };
    };
  };


}