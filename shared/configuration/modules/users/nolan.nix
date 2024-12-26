{ config, lib, ... }: {
  options = {
    sysconf.users.nolan = {
      enable = lib.mkOption {
        type = lib.types.bool;
	default = false;
      };
      authorizedKeys = lib.mkOption {
        type = lib.types.listOf lib.types.str;
	default = [];
	description = "Authorized keys";
      };
    };
  };

  config = lib.mkIf config.sysconf.users.nolan.enable {
    users.users.nolan = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = config.sysconf.users.nolan.authorizedKeys;
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
