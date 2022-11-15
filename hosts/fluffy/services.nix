{
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    flatpak = {
      enable = true;
    };
    earlyoom = {
      enable = true;
      enableNotifications = true;
      extraArgs = [
        "--avoid '(^|/)(sway|pipewire|pipewire-pulse|init|ssh)$'"
      ];
    };
  };
}
