{
  pkgs,
  #lib,
  user,
  ...
}:
{
  imports = [
  #  ./lib
    ./programs
  #  ./tweaks
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "24.11";

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
