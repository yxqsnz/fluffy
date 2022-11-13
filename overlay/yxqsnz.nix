self: super: {
  discord-canary = super.discord-canary.override { withOpenASAR = true; };
  mesa = super.mesa.override { enableOpenCL = true; };
}
