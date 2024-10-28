{ config, pkgs, ... }: {
  security.sudo = {
    enable = true;
    extraConfig = ''
      Defaults timestamp_timeout=60 # in minutes
    '';
  };
}