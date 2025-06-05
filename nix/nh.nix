{
  self,
  pkgs,
  inputs,
  ...
}:
{
  programs.nh = {
    enable = true;
    # package = inputs.nh.packages.${pkgs.system}.nh;
    clean = {
      enable = true;
      #dates = "3 days";
      extraArgs = "--keep-since 4d --keep 3";
      #extraArgs =
      #let
      #  numColorschemes = builtins.length self.homeConfigurations.mark.config.colorSchemes;
      #  numToKeep = numColorschemes * 2 |> toString;
      #in
      #"--keep ${numToKeep}";
    };
  };
  environment.variables.NH_FLAKE = "/home/mark/.config/nixos";
}
