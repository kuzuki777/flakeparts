{
  inputs,
  pkgs,
  #lib,
  user,
  ...
}:
{
  imports = [
  #  ./lib
    ./programs { inherit inputs; }
  #  ./tweaks
  ];

  home = {
    username = mark;
    homeDirectory = "/home/mark";
    stateVersion = "25.11";

    packages = with pkgs; [
      # files
      zip
      xz
      unzip
      # utils
      ripgrep
      zoxide
      fzf
      eza
      fd
    ];

  };

  programs = {
    git = {
      enable = true;
      userName = "kuzuki";
      userEmail = "markwangfreetyle@gmail.com";
      extraConfig = {
        safe = {
          directory = "*";
        };
      };
    };

    home-manager.enable = true;
  };
}
