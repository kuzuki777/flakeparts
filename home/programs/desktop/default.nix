{ pkgs, ... }:
{
  imports = [
    ./rofi.nix
    # ./tofi.nix
    # ./fonts.nix
    # ./mako.nix
    # ./niri
    # ./swhkd.nix
    # ./scroll
  ];
  # home.packages = with pkgs; [
  #   swww
  #   swaybg
  #   kanshi
  #   wlsunset
  #   wayneko
  # ];
  # home.file."scripts" = {
  #   source = ./scripts;
  #   recursive = true;
  # };
}
