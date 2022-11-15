{ pkgs, ... }: {
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;

    extraPackages = with pkgs; [
      mesa.opencl
      vaapiIntel
      libvdpau-va-gl
      vulkan-validation-layers
      vulkan-extension-layer
    ];
  };
}
