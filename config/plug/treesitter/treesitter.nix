{ pkgs, ... }: {
  plugins.treesitter = {
    enable = true;
    indent = true;
    folding = true;
    nixvimInjections = true;
    grammarPackages =
      pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };
}
