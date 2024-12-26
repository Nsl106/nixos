{ inputs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.file.".config/nvim/" = {
    source = ../../../dotfiles/neovim;
    recursive = true;
  };
}
