{
  inputs,
  nixpkgs,
  self,
  ...
}:
let
  sharedOSModules = [
    ../os
    ../nix
  ];

  sharedHomeModules = [
    ../home
  ] ++ (builtins.attrValues self.homeManagerModules);

  mkHost =
    {
      host,
      user,
      extraOSModules ? [ ],
      extraOSArgs ? { },
      extraHomeModules ? [ ],
      extraHomeArgs ? { },
      ...
    }:
    {
      nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit
            inputs
            nixpkgs
            self
            host
            user
            ;
        } // extraOSArgs;
        modules = extraOSModules ++ sharedOSModules;
      };

      homeConfigurations.mark = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {
          inherit
            inputs
            self
            host
            user
            ;
        } // extraHomeArgs;
        modules = extraHomeModules ++ sharedHomeModules;
      };
    };

in
{
  #flake = import ./hosts.nix |> map mkHost |> builtins.foldl' (x: y: x // y) { };
  flake = let
    hosts = import ./hosts.nix;
    configs = map mkHost hosts;
  in
    builtins.foldl' (acc: host: {
      nixosConfigurations = acc.nixosConfigurations // host.nixosConfigurations;
      homeConfigurations = acc.homeConfigurations // host.homeConfigurations;
    }) { nixosConfigurations = {}; homeConfigurations = {}; } configs;

}
