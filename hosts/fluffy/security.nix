{
  security = {
    sudo.enable = false;
    rtkit.enable = true;
    polkit.enable = true;
    doas = {
      enable = true;
      extraRules = [{ groups = [ "wheel" ]; keepEnv = true; persist = true; }];
    };
  };
}
