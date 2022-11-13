colorScheme:
let fonts = import ./fonts.nix;
in with colorScheme; {
  colors = {
    focused = {
      inherit text;

      background = surface;
      indicator = highlight.high;
      border = highlight.high;
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
  };
}
