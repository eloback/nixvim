{ pkgs, lib, ... }: {
  plugins.lint = {
    enable = true;
    lintersByFt = {
      json = [ "biomejs" ];
      dockerfile = [ "hadolint" ];
      nix = [ "nix" ];
      javascript = [ "biomejs" ];
      typescript = [ "biomejs" ];
      lua = [ "luacheck" ];
      fish = [ "fish" ];
      yaml = [ "yamllint" ];
    };
    linters = {
      hadolint = {
        cmd = "${pkgs.hadolint}/bin/hadolint";
      };
      nix = {
        cmd = "${pkgs.nixpkgs-lint}/bin/nixpkgs-lint";
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
    };

  };
}
