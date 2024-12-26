{ inputs, pkgs, ... }: {
  home.packages = [ inputs.matugen.packages.${pkgs.system}.default ];
  home.file.".config/matugen/" = {
    source = ../../../dotfiles/matugen;
    recursive = true;
  };
}
