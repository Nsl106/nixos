{ pkgs, inputs, ... }: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
#    gobject-introspection
#    inputs.ags.packages.${pkgs.system}.notifd
#    inputs.ags.packages.${pkgs.system}.mpris
#    inputs.ags.packages.${pkgs.system}.auth
    material-symbols
#    wl-screenrec
  ];

  programs.ags = {
    enable = true;

    # symlink to ~/.config/ags
    configDir = ../ags;

    # additional packages to add to gjs's runtime
    extraPackages = with pkgs; [
#      pkgs.libsoup_3
#      pkgs.gtksourceview
#      pkgs.libnotify
#      pkgs.webkitgtk_4_1
#      pkgs.gst_all_1.gstreamer
      inputs.ags.packages.${pkgs.system}.apps
      inputs.ags.packages.${pkgs.system}.battery
      inputs.ags.packages.${pkgs.system}.hyprland
      inputs.ags.packages.${pkgs.system}.wireplumber
      inputs.ags.packages.${pkgs.system}.network
      inputs.ags.packages.${pkgs.system}.tray
      inputs.ags.packages.${pkgs.system}.battery
      inputs.ags.packages.${pkgs.system}.notifd
      inputs.ags.packages.${pkgs.system}.mpris
      inputs.ags.packages.${pkgs.system}.bluetooth
      inputs.ags.packages.${pkgs.system}.auth
    ];
  };
}