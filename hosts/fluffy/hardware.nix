{ pkgs, ... }: {
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;

    extraPackages = with pkgs; [
      mesa.opencl
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
