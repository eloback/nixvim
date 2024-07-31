{ pkgs, lib, ... }: {
  plugins.lint = {
    enable = true;
    lintersByFt = {
      python = [ "flake8" ];
      json = [ "biomejs" ];
      dockerfile = [ "hadolint" ];
      nix = [ "statix" "deadnix" ];
      javascript = [ "biomejs" ];
      typescript = [ "biomejs" ];
      markdown = [ "markdownlint-cli2" ];
      lua = [ "luacheck" ];
      fish = [ "fish" ];
      yaml = [ "yamllint" ];
    };
    linters = {
      hadolint = {
        cmd = "${pkgs.hadolint}/bin/hadolint";
      };
      statix = {
        cmd = "${pkgs.statix}/bin/statix";
      };
      deadnix = {
        cmd = "${pkgs.deadnix}/bin/deadnix";
      };
      biomejs = {
        cmd = "${pkgs.biome}/bin/biome";
      };
      luacheck = {
        cmd = "${pkgs.luajitPackages.luacheck}/bin/luacheck";
      };
      fish = {
        cmd = "${pkgs.fish}/bin/fish";
      };
      yamllint = {
        cmd = "${pkgs.yamllint}/bin/yamllint";
      };
      flake8 = {
        cmd = "${pkgs.python3Packages.flake8}/bin/flake8";
      };
      markdownlint-cli2 = {
        cmd = "${pkgs.markdownlint-cli2}/bin/markdownlint-cli2";
      };
    };

  };
}
