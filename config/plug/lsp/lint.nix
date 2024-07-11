{
  plugins.lint = {
    enable = true;
    lintersByFt = {
      text = [ "vale" ];
      json = [ "jsonlint" ];
      markdown = [ "vale" ];
      dockerfile = [ "hadolint" ];
      nix = [ "nix" ];
      javascript = [ "biomejs" ];
      typescript = [ "biomejs" ];
      lua = [ "luacheck" ];
      fish = [ "fish" ];
      yaml = [ "yamllint" ];
    };
  };
}
