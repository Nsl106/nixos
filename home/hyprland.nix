{ config, pkgs, ... }: {
  home.file.".config/hypr/" = {
    source = ./hyprland;
    recursive = true;
  };
}
