{ pkgs, home-manager }: {
  mkHomeManagerUser = userName: extraModules: home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    modules = [
      {
        home.username = userName;
        home.homeDirectory = "/home/${userName}";
        home.stateVersion = "22.05";
        programs.home-manager.enable = true;
      }
      ../users/${userName}
    ] ++ extraModules;
  };

  mkSystemUser = { name, groups, uid, shell, initialPassword ? "123", ... }: {
    users.users."${name}" = {
      name = name;
      isNormalUser = true;
      isSystemUser = false;
      extraGroups = groups;
      uid = uid;
      shell = shell;
      initialPassword = initialPassword;
    };
  };
}
