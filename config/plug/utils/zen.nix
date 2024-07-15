{
  plugins.zen-mode = {
    enable = true;
    settings = {
      window = {
        backdrop = 0.95;
        width = .65;
        height = 1;
        options = {
          signcolumn = "no";
          number = false;
          relativenumber = false;
        };
      };
      plugins = {
        options = {
          enabled = true;
          ruler = true;
          showcmd = false;
          laststatus = 0;
        };
        twilight = {
          enabled = true;
          settings = {
            context = 10;
          };
        };
        gitsigns = {
          enabled = false;
        };
        tmux = {
          enabled = false;
        };
        kitty = {
          enabled = true;
          font = "+4";
        };
      };
    };
  };
  plugins.twilight.enable = true;
  keymaps = [
    {
      action = "<cmd>ZenMode<CR>";
      mode = "n";
      key = "<leader>uz";
      options = {
        desc = "Enter zenmode";
      };
    }
    {
      action = "<cmd>Twilight<CR>";
      mode = "n";
      key = "<leader>uT";
      options = {
        desc = "Enter Twilight";
      };
    }
  ];
}
