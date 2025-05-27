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



      [directory]
      format = "[╭─ $path ]($style)"
      style = "bold iris"
      truncation_length = 3
      truncation_symbol = "…/"

      [directory.substitutions]
      Documents = "󰈙"
      Pictures = " "

      [git_branch]
      format = "[](fg:overlay)[ $symbol $branch ]($style)[](fg:overlay) "
      style = "bg:overlay fg:foam"
      symbol = " "

      [git_status]
      disabled = false
      style = "fg:love"
      format = '([$all_status$ahead_behind]($style))'
      up_to_date = '[ 󰋑 ](fg:iris)'
      untracked = '[?\($count\)](fg:gold)'
      stashed = '[\$](fg:iris)'
      modified = '[!\($count\)](fg:gold)'
      renamed = '[»\($count\)](fg:iris)'
      deleted = '[✘\($count\)](style)'
      staged = '[++\($count\)](fg:gold)'
      ahead = '[⇡\($count\)](fg:foam)'
      diverged = '⇕[\[](fg:iris)[⇡\($ahead_count\)](fg:foam)[⇣\($behind_count\)](fg:rose)[\]](fg:iris)'
      behind = '[⇣\($count\)](fg:rose)'

      [time]
      disabled = false
      format = " [](fg:overlay)[ $time 󰧱 ]($style)[](fg:overlay)"
      style = "bg:overlay fg:purple"
      time_format = "%H:%M"
      use_12hr = true

      [username]
      disabled = false
      format = "[](fg:overlay)[ 󰧱 $user ]($style)[](fg:overlay) "
      show_always = true
      style_root = "bg:overlay fg:iris"
      style_user = "bg:overlay fg:iris"

      
    '';
}
