{ config, lib, ... }: {
  options = {
    sysconf.terminal = {
      fun.enable = lib.mkOption {
        type = lib.types.bool;
	default = false;
	description = "Enable fun terminal programs such as pipes.sh, cbonsai, neofetch, etc.";
      };
    };
  };

  config = {

  };
}
