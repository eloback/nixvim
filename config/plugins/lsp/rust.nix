{
  plugins.rustaceanvim = {
    enable = true;
    # settings = {
    #   server = {
    #     cmd = [
    #       "rustup"
    #       "run"
    #       "nightly"
    #       "rust-analyzer"
    #     ];
    #   };
    # };
  };
  plugins.crates-nvim = {
    enable = true;
    extraOptions = {
      completion = {
        cmp = {enabled = true;};
      };
    };
  };
}
