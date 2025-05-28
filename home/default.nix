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
    autoEnable = false;
    base16Scheme = "${inputs.base16-schemes}/share/themes/rose-pine.yaml";
    # targets = {
    #   console.enable = true;
    #   gnome.enable = true;
    #   grub.enable = true;
    #   plymouth.enable = true;
    # };
  };

}
