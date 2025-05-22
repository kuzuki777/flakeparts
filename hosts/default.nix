# hosts/default.nix
{ inputs, system }:

{
  nixosConfigurations = {
    nixos = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        (import ../os)
        #../os/system/configuration.nix
        # Optionally add home-manager here if using it as a NixOS module:
        # inputs.home-manager.nixosModules.home-manager
      ];
    };
  };

  homeConfigurations = {
    mark = inputs.home-manager.lib.homeManagerConfiguration {
      inherit system;
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      modules = [
        ../home
      ];
      extraSpecialArgs = {
        user = "mark";
      };
    };
  };
}

