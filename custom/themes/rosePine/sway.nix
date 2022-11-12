colorScheme: with colorScheme; {
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

  gaps = {
    inner = 7;
    outer = 7;
  };
}