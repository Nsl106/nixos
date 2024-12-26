{ ... }: {
  imports = [
    ./garbage-collection.nix
    ./network.nix
    ./desktop.nix
    ./users/root.nix
    ./users/nolan.nix
    ./sudo.nix
    ./terminal.nix
  ];
}
