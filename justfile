default:
  @just --list

deploy:
  nixos-rebuild switch --use-remote-sudo

hyprland-clean:
  rm -rf ${HOME}/.config/hypr

hyprland-deploy:
  #rm -rf ${HOME}/.config/hypr
  cp -r shared/dotfiles/hypr/* ${HOME}/.config/hypr
  hyprctl reload
