{
  plugins.lint = {
    enable = true;
    lintersByFt = {
      text = [ "vale" ];
      json = [ "jsonlint" ];
      markdown = [ "vale" ];
      dockerfile = [ "hadolint" ];
      nix = [ "nix" ];
      javascript = [ "eslint_d" ];
      typescript = [ "eslint_d" ];
      lua = [ "luacheck" ];
      fish = [ "fish" ];
      yaml = [ "yamllint" ];
    };
  };
}
