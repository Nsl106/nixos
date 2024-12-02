{
  programs.cava = {
    enable = false;
    settings = {
      color = {
        background = "default";
        foreground = "'#bb9af7'";
      };
      general = {
        framerate = 60;

        # 'autosens' will attempt to decrease sensitivity if the bars peak. 1 = on, 0 = off
        # new as of 0.6.0 autosens of low values (dynamic range)
        # 'overshoot' allows bars to overshoot (in % of terminal height) without initiating autosens. DEPRECATED as of 0.6.0
        autosens = 1;
        overshoot = 20;

        sensivitity = 100;

        bars = 0; #0 is auto fill width
        bar_width = 1;
        bar_spacing = 1;

        sleep_timer = 300;
      };
      output = {
        # Visual channels. Can be 'stereo' or 'mono'.
        # 'stereo' mirrors both channels with low frequencies in center.
        # 'mono' outputs left to right lowest to highest frequencies.
        # 'mono_option' set mono to either take input from 'left', 'right' or 'average'.
        # set 'reverse' to 1 to display frequencies the other way around.
        channels = "stereo";
        mono_option = "average";
        reverse = 0;

        # enable alacritty synchronized updates. 1 = on, 0 = off
        # removes flickering in alacritty terminal emulator.
        # defaults to off since the behaviour in other terminal emulators is unknown
        alacritty_sync = 1;
      };
      input = {
        method = "pulse";
        source = "auto";
      };
    };
  };
}
