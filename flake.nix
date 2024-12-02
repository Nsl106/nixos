{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:aylur/ags";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix

        {
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
        
        # When home manager is a module it will be deployed automatically with "nixos-rebuild switch"
        home-manager.nixosModules.home-manager {
	      home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nolan = import ./home.nix;
        }
      ];
    };
  };
}
