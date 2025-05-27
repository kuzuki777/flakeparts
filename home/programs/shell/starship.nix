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

      [character]
      format = "$symbol "
      success_symbol = "[╰─](bold iris)[ ](bold iris)"
      error_symbol = "[╰─](bold iris)[ ](bold love)"
      vimcmd_symbol = "[╰─](bold iris)[ ](bold foam)"
      vimcmd_visual_symbol = "[╰─](bold iris)[ ](bold pine)"
      vimcmd_replace_symbol = "[╰─](bold iris)[ ](bold gold)"
      vimcmd_replace_one_symbol = "[╰─](bold iris)[ ](bold gold)"



      
    '';
}
