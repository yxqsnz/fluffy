{
  programs.firefox = {
    enable = true;
    profiles = {
      main = {
        settings = {
          "media.ffmpeg.vaapi.enabled" = true;
          "media.av1.enabled" = false;
          "general.smoothScroll.msdPhysics.enabled" = true;
          "extensions.pocket.enabled" = false;
        };
      };
    };
  };
}
