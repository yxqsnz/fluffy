{ pkgs, colorScheme }:
let fonts = import ./fonts.nix;
in with colorScheme; {
  colors = {
    focused = {
      inherit text;

      background = surface;
      indicator = highlight.high;
      border = overlay;
      childBorder = highlight.high;
    };

    unfocused = {
      inherit text;

      background = base;
      indicator = highlight.low;
      border = highlight.low;
      childBorder = highlight.low;
    };

    urgent = {
      inherit text;

      background = love;
      indicator = love;
      border = love;
      childBorder = love;
    };
  };

  fonts = {
    names = [ fonts.normal.family ];
    style = "Regular";
    size = fonts.normal.size + 0.0;
  };

  gaps = {
    inner = 4;
    outer = 4;
    smartGaps = true;
  };

  bars = [{
    fonts = {
      names = [ fonts.normal.family ];
      style = "Regular";
      size = fonts.normal.size + 0.0;
    };

    position = "bottom";

    colors = {
      background = base;
      statusline = text;

      focusedWorkspace = {
        background = overlay;
        border = highlight.med;

        inherit text;
      };

      inactiveWorkspace = {
        background = highlight.low;
        border = highlight.med;

        inherit text;
      };

      urgentWorkspace = {
        background = love;
        border = highlight.med;

        inherit text;
      };
    };

    statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
  }];

  extraPrograms = import ./i3status-rust.nix;
}

