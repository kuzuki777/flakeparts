{
  inputs,
  pkgs,
  #lib,
  #user,
  ...
}:
{
  imports = [
  #  ./lib
    ./programs
  #  ./tweaks
  ];

  home = {
    username = "mark";
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
      userName = "mark wang";
      userEmail = "markwangfreetyle@gmail.com";
      extraConfig = {
        safe = {
          directory = "*";
        };
      };
    };
    home-manager.enable = true;
  };

  stylix = {
    enable = true;
    # autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    # overlays = {
    #   enable = true;
    # };
    image = pkgs.fetchurl {
      url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
      hash = "sha256-enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
   };
    # polarity = "dark";
    # targets = {
    #   console.enable = true;
    #   gnome.enable = true;
    #   grub.enable = true;
    #   plymouth.enable = true;
    # };
  };

}
