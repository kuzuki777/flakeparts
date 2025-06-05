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
      # Dev
      python313
      nodejs_22
      openjdk21
      awscli2
      mysql-workbench
      vscode
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
    autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    image = pkgs.fetchurl {
      url = "https://i.imgur.com/c3CWmia.jpeg";
      sha256 = "0lgqwjl6jd1y84cz368s4sq0krzg67znqxirzapqxqvfdpn9rwbw";
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
