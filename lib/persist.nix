{
  environment = {
    etc = {
      "NetworkManager/system-connections" = {
        source = "/nix/persist/data/networkManager.systemConnections";
      };

      "machine-id" = {
        source = "/nix/persist/data/machineId";
      };
    };
  };
}
