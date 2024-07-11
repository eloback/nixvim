{ pkgs, ... }: {
  plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = true;
      timeoutMs = 500;
    };
    notifyOnError = true;
    formattersByFt = {
      javascript = [ [ "biome" "biome-check" ] ];
      typescript = [ [ "biome" "biome-check" ] ];
      lua = [ "stylua" ];
      nix = [ "nixpkgs_fmt" ];
      markdown = [ [ "biome" ] ];
      yaml = [ "yamllint" "yamlfmt" ];
    };
  };
  extraConfigLua = ''
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })
  '';
  keymaps = [
    {
      mode = [ "n" "v" ];
      key = "<leader>cf";
      action = "<cmd>Format<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
  extraPackages = with pkgs; [ prettierd stylua nixpkgs-fmt yamllint yamlfmt ];
}
