{ pkgs, ... }: {
  extraPlugins = with pkgs.vimUtils;[
    (buildVimPlugin {
      pname = "portal.nvim";
      version = "1.0";
      src = pkgs.fetchFromGitHub {
        owner = "cbochs";
        repo = "portal.nvim";
        rev = "77d9d53fec945bfa407d5fd7120f1b4f117450ed";
        hash = "sha256-QCdyJ5in3Dm4IVlBUtbGWRZxl87gKHhRiGmZcIGEHm0=";
      };
    })
  ];

  keymaps = [
    {
      mode = "n";
      key = "<C-o>";
      action = "<CMD>Portal jumplist backward<CR>";
      options.desc = "Portal jumplist backward";
    }

    {
      mode = "n";
      key = "<C-i>";
      action = "<CMD>Portal jumplist forward<CR>";
      options.desc = "Portal jumplist forward";
    }

    {
      mode = "n";
      key = "<C-p>";
      action = "<CMD>lua require(\"portal.builtin\").grapple.tunnel()<CR>";
      options.desc = "Portal grapple tags";
    }
  ];
}
