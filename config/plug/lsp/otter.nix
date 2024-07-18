{
  plugins.otter = {
    enable = true;
    settings = {
      lsp = {
        diagnostic_update_events = [ "BufWritePost" ];
      };
      buffers = {
        set_filetype = true;
        write_to_disk = false;
      };
      handle_leading_whitespace = true;
      wrapping_quote_characters = [ "\"" "'" "`" ];
    };
  };

  keymaps = [
    {
      action = "<cmd>lua require('otter').activate()<cr>";
      key = "<leader>cO";
      mode = "n";
    }
  ];
}
