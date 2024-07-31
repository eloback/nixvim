{ pkgs, ... }: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "markview.nvim";
      version = "0.0.1";
      src = pkgs.fetchFromGitHub {
        owner = "OXY2DEV";
        repo = "markview.nvim";
        rev = "d0ccc97b5c988fb28e5033abdf7b832b9dfaf897";
        hash = "sha256-mhRg/cszW/3oXdC1yvbpCeqWQA9WLW5FvcqGd/wBTnE=";
      };
    })
  ];

  extraConfigLua = ''
    require("markview").setup();
  '';
}
