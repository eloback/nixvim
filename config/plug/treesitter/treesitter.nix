{ pkgs, ... }: {
  plugins.treesitter = {
    enable = true;
    settings = {
      indent.enable = true;
      highlight = {
        enable = true;
      };
    };
    folding = true;
    nixvimInjections = true;
    gccPackage = null;
    nixGrammars = true;
  };
}
