{ config, pkgs, inputs, ... }: {
  imports = [
    ./home
  ];

  home.username = "nolan";
  home.homeDirectory = "/home/nolan";

  home.packages = with pkgs; [
    neofetch
    firefox
    vscodium
    asciiquarium
    jetbrains.idea-ultimate
    nodejs
    obsidian
    nerd-fonts.jetbrains-mono
    usbutils
    inputs.swww.packages.${pkgs.system}.swww
    inputs.matugen.packages.${pkgs.system}.default
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
