self: super: {
  discord-canary = super.discord-canary.override { withOpenASAR = true; };
  nvtop          = super.nvtop.override { nvidia = false; };
  steam          = super.steam.override { extraProfile = ''unset VK_ICD_FILENAMES''; };
}
