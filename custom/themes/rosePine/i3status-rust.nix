{
  i3status-rust = {
    enable = true;
    bars = {
      top = {
        blocks = [
          {
            block = "disk_space";
            path = "/home";
            alias = "/home";
            info_type = "used";
            unit = "GB";
            interval = 60;
            warning = 20.0;
            alert = 10.0;
          }
          {
            block = "memory";
            display_type = "memory";
            format_mem = "{mem_used}";
            format_swap = "{swap_used}";
          }
          {
            block = "cpu";
            interval = 1;
          }
          {
            block = "load";
            interval = 1;
            format = "{1m}";
          }
          { block = "sound"; }
          {
            block = "time";
            interval = 60;
            format = "%a %d/%m %R";
          }
        ];
        settings = {
          theme = {
            name = "native";
            # overrides = {
            #   idle_bg = "#123456";
            #   idle_fg = "#abcdef";
            # };
          };
        };
        icons = "none";
        theme = "nord-dark";
      };
    };
  };
}
