{ config, pkgs, inputs, ... }: {
  imports =
    [
      ./hardware-configuration.nix
      ./modules # host-specific modules
      ../../shared/configuration
    ];

  sysconf = {
    host = "framework";
    terminal.fun.enable = true;
    desktop = {
      enable = true;
      programs = {
        gui = true;
	games = true;
      };
      hyprlandMonitors = ["eDP-2,2560x1600@60,0x0,auto"];
    };
    users = {
      root = {
        authorizedKeys = [];
      };

      nolan = {
        enable = true;
        authorizedKeys = [];
      };
    };
    sudoTimeout = 120;
  };


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    just
    brightnessctl
    openjdk17
  ];

  services.upower.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
}
