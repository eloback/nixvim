{
  plugins.quickmath = {
    enable = true;
    # keymap.key = "<leader>M";
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "+misc";
    }
    {
      mode = "n";
      key = "<leader>em";
      action = "<cmd>n playground.playground | Quickmath<cr>";
      options = {
        desc = "playground";
      };
    }
  ];
  # UI: view marks in buffer
  plugins.marks = {
    enable = true;
    defaultMappings = false;
  };
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
