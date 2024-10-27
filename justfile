default:
  @just --list

deploy:
  nixos-rebuild switch --use-remote-sudo

hyprland-clean:
  rm -rf ${HOME}/.config/hypr

hyprland-test:
  rm -rf ${HOME}/.config/hypr
  rsync -avz --copy-links home/hyprland/ ${HOME}/.config/hypr
