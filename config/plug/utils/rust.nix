{
  plugins.rustaceanvim = {
    enable = true;
  };
  plugins.crates-nvim = {
    enable = true;
    extraOptions = {
      completion = {
        crates = { enabled = true; max_results = 8; min_chars = 3; };
      };
      lsp = {
        enabled = true;
        actions = true;
        completion = true;
        hover = true;
      };
    };
  };
  plugins.bacon.enable = true;
}
