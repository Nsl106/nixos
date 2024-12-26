{ osConfig, inputs, pkgs, lib, ... }: {
  config = lib.mkIf osConfig.sysconf.terminal.fun.enable {
    home.packages = with pkgs; [
      neofetch
      asciiquarium
      cbonsai
      pipes
    ]; 
  };
}
