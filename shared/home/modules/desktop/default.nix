{ osConfig, pkgs, inputs, lib, ... }: {
  imports = lib.optionals osConfig.sysconf.desktop.enable [
    ./neovim.nix
    ./theme.nix
    ./ags.nix
    ./matugen.nix
  ];

  config = lib.mkIf osConfig.sysconf.desktop.enable {
    home.file.".config/hypr/" = {
      source = ../../../dotfiles/hypr;
      recursive = true;
    };
    home.file.".config/kitty/" = {
      source = ../../../dotfiles/kitty;
      recursive = true;
    };
    home.file.".config/hypr/monitors.conf".text = lib.strings.concatLines(lib.lists.forEach osConfig.sysconf.desktop.hyprlandMonitors (x: "monitor = ${x}"));
    home.file.".config/electron-flags.conf".text = "--enable-features=UseOzonePlatform\n--ozone-platform=wayland";
    home.packages = with pkgs; [
      pkgs.kitty
      inputs.swww.packages.${pkgs.system}.swww
      firefox
      vscodium
      jetbrains.idea-ultimate
      obsidian
      github-desktop
      nerd-fonts.jetbrains-mono
    ];
  }; 
}
