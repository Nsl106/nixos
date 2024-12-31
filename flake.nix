{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.astal.follows = "astal";
    };

    swww.url = "github:LGFae/swww";
    matugen.url = "github:/InioX/Matugen?ref=8384ba04eff977d7f122f179dc7af6e3c40ebe34";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      framework = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/framework/configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.nolan = ./shared/home/nolan;
              extraSpecialArgs = { inherit inputs; };
              backupFileExtension = "backup";
	    };
          }
        ];
      };
    };
  };
}
