{
  plugins.zen-mode = {
    enable = true;
    settings = {
      window = {
        backdrop = 0.95;
        width = 120;
        height = 1;
        options = {
          signcolumn = "no";
          number = false;
          relativenumber = false;
        };
      };
      on_close = ''
        function()
          require("gitsigns.actions").toggle_current_line_blame()
          vim.cmd('IBLEnable')
          vim.opt.relativenumber = true
          vim.opt.signcolumn = "yes:2"
          require("gitsigns.actions").refresh()
        end
      '';
      on_open = ''
        function()
          require("gitsigns.actions").toggle_current_line_blame()
          vim.cmd('IBLDisable')
          vim.opt.relativenumber = false
          vim.opt.signcolumn = "no"
          require("gitsigns.actions").refresh()
        end
      '';
      plugins = {
        options = {
          enabled = true;
          ruler = true;
          showcmd = false;
          laststatus = 0;
        };
        twilight = { enabled = true; };
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
