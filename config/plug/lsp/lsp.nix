{
  plugins = {
    # lsp-format = { enable = true; };
    lsp = {
      enable = true;
      servers = {
        biome = { enable = true; };
        html = { enable = true; };
        lua-ls = { enable = true; };
        nil-ls = { enable = true; autostart = false; };
        nixd = {
          enable = true;
          settings = {
            nixpkgs = {
              expr = "import <nixpkgs> { }";
            };
            # options.nixvim.expr = ''(builtins.getFlake "/path/to/flake").packages.${system}.neovimNixvim.options'';
            options = {
              nixos = {
                expr = ''(builtins.getFlake "/home/eloback/nixos").nixosConfigurations.eloback.options'';
              };
              home_manager = {
                expr = ''(builtins.getFlake "/home/eloback/nixos").homeConfigurations."vern@eloback".options'';
              };
            };
          };
        };
        marksman = { enable = true; };
        tsserver = { enable = true; };
        pyright = { enable = true; };
        yamlls = {
          enable = true;
        };
      };
      keymaps = {
        silent = true;
        lspBuf = {
          # gd = {
          #   action = "definition";
          #   desc = "Goto Definition";
          # };
          # gr = {
          #   action = "references";
          #   desc = "Goto References";
          # };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          # gI = {
          #   action = "implementation";
          #   desc = "Goto Implementation";
          # };
          # gT = {
          #   action = "type_definition";
          #   desc = "Type Definition";
          # };
          # K = {
          #   action = "hover";
          #   desc = "Hover";
          # };
          # "<leader>cw" = {
          #   action = "workspace_symbol";
          #   desc = "Workspace Symbol";
          # };
          # "<leader>cr" = {
          #   action = "rename";
          #   desc = "Rename";
          # };
        };
        diagnostic = {
          # "<leader>cd" = {
          #   action = "open_float";
          #   desc = "Line Diagnostics";
          # };
          # "[d" = {
          #   action = "goto_next";
          #   desc = "Next Diagnostic";
          # };
          # "]d" = {
          #   action = "goto_prev";
          #   desc = "Previous Diagnostic";
          # };
        };
      };
    };
  };
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
