{
  plugins.rustaceanvim = {
    enable = true;
    settings = {
      server = {
        on_attach.__raw = ''
          function(_, bufnr)
            vim.keymap.set("n", "<leader>cR, function() vim.cmd.RustLsp("codeAction") end, { desc = "Code Action", buffer = bufnr })
            vim.keymap.set("n", "<leader>dr", function() vim.cmd.RustLsp("debuggables") end, { desc = "Rust Debuggables", buffer = bufnr })
          end
        '';
      };
    };
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
