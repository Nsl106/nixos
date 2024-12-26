{ config, lib, ... }: {
  options = {
    sysconf.users.root = {
      authorizedKeys = lib.mkOption {
        type = lib.types.listOf lib.types.str;
	default = [];
	description = "Authorized keys";
      };
    };
  };

  config = {
    users.users.root = {
      openssh.authorizedKeys.keys = config.sysconf.users.root.authorizedKeys;
    };
  };
}
