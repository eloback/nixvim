{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [
    grapple-nvim
  ];

  plugins.telescope.enabledExtensions = [
    "grapple"
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>nr";
      action = "<CMD> Grapple reset <CR>";
      options = { desc = "Grapple Toggle tag"; };
    }
    {
      mode = "n";
      key = "<C-s>";
      action = "<CMD> Grapple toggle <CR>";
      options = { desc = "Grapple Toggle tag"; };
    }

    {
      mode = "n";
      key = "<leader>k";
      action = "<CMD> Grapple toggle_tags <CR>";
      options = { desc = "Grapple Toggle tag"; };
    }

    {
      mode = "n";
      key = "<leader>K";
      action = "<CMD> Grapple toggle_scopes <CR>";
      options = { desc = "Grapple Toggle scopes"; };
    }

    {
      mode = "n";
      key = "<leader>j";
      action = "<CMD> Grapple cycle forward <CR>";
      options = { desc = "Grapple Cycle forward"; };
    }

    {
      mode = "n";
      key = "<leader>J";
      action = "<CMD> Grapple cycle backward <CR>";
      options = { desc = "Grapple Cycle backward"; };
    }

    {
      mode = "n";
      key = "<leader>1";
      action = "<CMD> Grapple select index=1<CR>";
      options = { desc = "Grapple Select 1"; };
    }

    {
      mode = "n";
      key = "<leader>2";
      action = "<CMD> Grapple select index=2<CR>";
      options = { desc = "Grapple Select 2"; };
    }

    {
      mode = "n";
      key = "<leader>3";
      action = "<CMD> Grapple select index=3<CR>";
      options = { desc = "Grapple Select 3"; };
    }

    {
      mode = "n";
      key = "<leader>4";
      action = "<CMD> Grapple select index=4<CR>";
      options = { desc = "Grapple Select 4"; };
    }

  ] ++
  (builtins.map
    (key: {
      inherit key;
      mode = "n";
      action = "<CMD> Telescope grapple tags<CR>";
      options = { desc = "Grapple Telescope Tags"; };
    }) [ "<leader>st" ";" ]);

  extraConfigLua = ''
    require('grapple').setup({
      scope = "git",
      icons = true;
    })
  '';
}
