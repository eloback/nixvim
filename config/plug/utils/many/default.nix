{
  plugins.quickmath = {
    enable = true;
    # keymap.key = "<leader>M";
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>math";
      action = "<cmd>n playground.playground | Quickmath<cr>";
      options = {
        desc = "playground";
      };
    }
  ];
  plugins.qmk = {
    enable = false;
    settings = {
      name = "adv360-nvim";
      layout = [
      ];
      variant = "zmk";
    };
  };
  plugins.nvim-colorizer = {
    enable = true;
  };
}
