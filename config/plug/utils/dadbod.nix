{ pkgs
, lib
, ...
}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "vim-dadbod";
      src = pkgs.fetchFromGitHub {
        owner = "tpope";
        repo = "vim-dadbod";
        rev = "7888cb7164d69783d3dce4e0283decd26b82538b";
        hash = "sha256-8wnUSYctVn3JeCVz2fdi9qcKi8ZyA4To+xs4WaP6rog=";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "vim-dadbod-ui";
      src = pkgs.fetchFromGitHub {
        owner = "kristijanhusak";
        repo = "vim-dadbod-ui";
        rev = "2527310098e7458488e61a528614da142aa2dc42";
        hash = "sha256-ebXrC7jN7ahmDGVwtK9SJp8AEvfAZeCSeGWAq+7H8pc=";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "vim-dadbod-completion";
      src = pkgs.fetchFromGitHub {
        owner = "kristijanhusak";
        repo = "vim-dadbod-completion";
        rev = "8c9051c1cfc73fcf5bfe9a84db7097e4f7c0180d";
        hash = "sha256-C02MwQECUl61Tn0SKMV0xXW12V/W7/sCpE8lg5OW7Ww=";
      };
    })
  ];
  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>uD";
      action = "<cmd>DBUIToggle<cr>";
      options = { desc = "Open DB ui."; };
    }
  ];
}
