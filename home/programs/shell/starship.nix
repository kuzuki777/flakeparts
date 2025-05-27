{ config, ... }:
{
  programs.starship = {
    enable = true;
  };
  xdg.configFile."starship.toml".text =
    with config.lib.stylix.colors.withHashtag;
    # toml
    ''
      format = """
      $directory\
      $git_branch\
      $git_status\
      $time\n\
      $character \
      """

      palette = "rose-pine"





      
    '';
}
