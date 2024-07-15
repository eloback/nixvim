{
  plugins.trouble = {
    enable = true;
    settings = {
      auto_close = true;
      auto_preview = true;
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>Trouble document_diagnostics<cr>";
      options = {
        desc = "Diagnostics  (Buffer)";
      };
    }
    {
      mode = "n";
      key = "<leader>xX";
      action = "<cmd>Trouble workspace_diagnostics<cr>";
      options = {
        desc = "Diagnostics";
      };
    }
  ];
}
