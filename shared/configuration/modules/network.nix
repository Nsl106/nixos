{ config, lib, ... }: {
  options = {
    sysconf = {
      host = lib.mkOption {
        type = lib.types.str;
	default = config.system.nixos.distroId;
	description = "Networking Hostname";
      };
    };
  };

  config = {
    networking = {
      hostName = config.sysconf.host;
      networkmanager.enable = true;
    };
  };
}
