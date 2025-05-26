# hosts/default.nix
{ inputs, nixpkgs, system }:
{

  nixosConfigurations = {
    nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ../os
      ];
    };
  };

  homeConfigurations = {
    mark = {
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      modules = [
        ../home
      ];
    };
  };

  # flake.nixosConfigurations = {
  #   nixos = inputs.nixpkgs.lib.nixosSystem {
  #     inherit system;
  #     modules = [
  #       (import ../os)
  #       #../os/system/configuration.nix
  #       # Optionally add home-manager here if using it as a NixOS module:
  #               # Enable Home Manager as a NixOS module
  #       inputs.home-manager.nixosModules.home-manager
  #       {
  #         home-manager.useGlobalPkgs = true;
  #         home-manager.useUserPackages = true;
  #         home-manager.users.mark = import ./../home { 
  #           inherit inputs system;
  #           pkgs = inputs.nixpkgs.legacyPackages.${system};};
  #       }
  #     ];
  #   };
  # };

  # homeConfigurations = {
  #   mark = inputs.home-manager.lib.homeManagerConfiguration {
  #     # inherit system;
  #     pkgs = inputs.nixpkgs.legacyPackages.${system};
  #     modules = [
  #       ../home
  #       inputs.nixvim.homeManagerModules.nixvim
  #     ];
  #     extraSpecialArgs = {
  #       user = "mark";
  #       inherit inputs;  # Add this line to pass inputs
  #     };
  #   };
  # };
}

