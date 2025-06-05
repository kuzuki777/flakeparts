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

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-unstable = {
      url = "github:YalTeR/niri";
      flake = false;
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.niri-unstable.follows = "niri-unstable";
    };

    nixd = {
      url = "github:nix-community/nixd";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    treefmt-nix.url = "github:numtide/treefmt-nix";

  };

  outputs = inputs@{ flake-parts, nixpkgs, home-manager, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {

      systems = [ "x86_64-linux" ];

      imports = [
        # To import a flake module
        # 1. Add foo to inputs
        # 2. Add foo as a parameter to the outputs function
        # 3. Add here: foo.flakeModule
        # home-manager.flakeModules.home-manager
        inputs.treefmt-nix.flakeModule
        { _module.args = { inherit inputs self nixpkgs; }; }

      ];
      
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        # Per-system attributes can be defined here. The self' and inputs'
        # module parameters provide easy access to attributes of the same
        # system.
        treefmt = {
            projectRootFile = "flake.nix";
            programs.nixfmt.enable = true;
            programs.ruff-format.enable = true;
            programs.prettier.enable = true;
            programs.beautysh.enable = true;
            programs.toml-sort.enable = true;
            settings.global.excludes = [ "*.age" ];
            settings.formatter = {
              jsonc = {
                command = "${pkgs.nodePackages.prettier}/bin/prettier";
                includes = [ "*.jsonc" ];
              };
              scripts = {
                command = "${pkgs.beautysh}/bin/beautysh";
                includes = [ "*/scripts/*" ];
              };
            };
          };

        # Equivalent to  inputs'.nixpkgs.legacyPackages.hello;
        packages.default = pkgs.hello;
      };

      flake = {
        # Merge the nixosConfigurations and homeConfigurations into top-level flake outputs
        # so other tools like `nixos-rebuild` or `home-manager` can use them
        inherit ( import ./hosts { 
            inherit nixpkgs inputs;
            system = "x86_64-linux";
          })
          nixosConfigurations homeConfigurations;
      };
    };
}
