{ inputs, nixpkgs, system }:

let
  pkgs = nixpkgs.legacyPackages.${system};
in
{
  nixosConfigurations = {
    nixos = nixpkgs.lib.nixosSystem {
      system = system;
      modules = [ 
        ../os
        inputs.stylix.nixosModules.stylix
      ];
      specialArgs = { inherit inputs; self = inputs.self;};
    };
  };

  homeConfigurations = {
    mark = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ 
        ../home
        ./modules/home-manager
        inputs.stylix.homeModules.stylix
      ];
      extraSpecialArgs = { 
        inherit inputs;
        self = inputs.self;
      };
    };
  };

}

