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
        inputs.niri.nixosModules.niri
      ];
      specialArgs = { inherit inputs; self = inputs.self;};
    };
  };

  homeConfigurations = {
    mark = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ 
        ../home
        ../modules/home-manager
        inputs.stylix.homeModules.stylix
        inputs.niri.homeModules.niri
      ];
      extraSpecialArgs = { 
        inherit inputs;
        self = inputs.self;
      };
    };
  };

}

