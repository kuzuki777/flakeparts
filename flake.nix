{
  description = "Flake For NixOs and Home-manager standalone";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    #Add Home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # optional but recommended

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ flake-parts, home-manager, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {

      systems = [ "x86_64-linux" ];

      # imports = [
      #   # To import a flake module
      #   # 1. Add foo to inputs
      #   # 2. Add foo as a parameter to the outputs function
      #   # 3. Add here: foo.flakeModule
      #   # home-manager.flakeModules.home-manager
      #   ({ inputs, ... }:
      #     import ./hosts {
      #       inherit inputs;
      #       system = "x86_64-linux";
      #     })
      # ];
      
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        # Per-system attributes can be defined here. The self' and inputs'
        # module parameters provide easy access to attributes of the same
        # system.

        # Equivalent to  inputs'.nixpkgs.legacyPackages.hello;
        packages.default = pkgs.hello;
      };

      flake = {
        nixosConfigurations = import ./hosts{ inherit nixpkgs;};
      }
      
      # flake = {
      #   nixosConfigurations = import ./hosts { inherit inputs; system = "x86_64-linux"; };
      #   homeConfigurations = import ./hosts { inherit inputs; system = "x86_64-linux"; };
      # };
    };
}
