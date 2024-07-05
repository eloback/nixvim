{
  plugins.rustaceanvim = {
    enable = true;
  };
  plugins.crates-nvim = {
    enable = true;
    extraOptions = {
      completion = {
        cmp = { enabled = true; };
      };
    };
  };
}
