self: super: {
      discord-canary = super.discord-canary.override { withOpenASAR = true; };
}
