{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs
    usbutils
  ];
}
