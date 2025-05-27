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

      [palettes.rose-pine]
      overlay = '${base01}'
      love = '${base08}'
      gold = '${base0A}'
      rose = '${base07}'
      pine = '${base0D}'
      foam = '${base0B}'
      iris = '${base0E}'



      
    '';
}
