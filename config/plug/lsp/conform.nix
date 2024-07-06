{ pkgs, ... }: {
  plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = true;
      timeoutMs = 500;
    };
    notifyOnError = true;
    formattersByFt = {
      html = [ [ "prettierd" ] ];
      css = [ [ "prettierd" ] ];
      javascript = [ [ "prettierd" ] ];
      typescript = [ [ "prettierd" ] ];
      lua = [ "stylua" ];
      nix = [ "nixpkgs-fmt" ];
      markdown = [ [ "prettierd" ] ];
      yaml = [ "yamllint" "yamlfmt" ];
    };
  };
  extraPackages = with pkgs; [ prettierd stylua nixpkgs-fmt yamllint yamlfmt ];
}
