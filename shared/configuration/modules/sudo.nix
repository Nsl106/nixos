{ config, lib, ... }: {
  options = {
    sysconf = {
      sudoTimeout = lib.mkOption {
        type = lib.types.int;
	default = 60;
	description = "Sudo time before re-requiring password input in minutes.";
      };
    };
  };

  config = {
    security.sudo = {
      enable = true;
      extraConfig = ''
        Defaults timestamp_timeout=${toString config.sysconf.sudoTimeout} # in minutes
      '';
    };
  };
}
