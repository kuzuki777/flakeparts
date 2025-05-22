{
  programs.nixvim = {
    enable = true;
    colorscheme = "tokyonight";
    plugins = {
      treesitter = {
        enable = true;
      };
    };
  };
}