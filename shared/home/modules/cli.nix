{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    killall
  ];
}
