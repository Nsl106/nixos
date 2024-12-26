{ config, lib, ... }: {
  options = {
    sysconf.desktop = {
      enable = lib.mkOption {
        type = lib.types.bool;
	default = false;
	description = "Enable Desktop Environment";
      };
      programs = {
        gui = lib.mkOption {
	  type = lib.types.bool;
	  default = false;
	  description = "Base GUI Programs";
	};
        games = lib.mkOption {
	  type = lib.types.bool;
	  default = false;
	};
      };

      hyprlandMonitors = lib.mkOption {
        type = lib.types.listOf lib.types.str;
	default = [];
	description = "A list of monitor lines added to the hyprland config.";
      };
    };
  };

  config = lib.mkIf config.sysconf.desktop.enable {
    hardware.graphics.enable = true;

    programs.hyprland = {
      enable = true;
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
