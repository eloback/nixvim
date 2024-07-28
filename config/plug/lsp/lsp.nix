{
  plugins = {
    # lsp-format = { enable = true; };
    lsp = {
      enable = true;
      servers = {
        biome = { enable = true; };
        html = { enable = true; };
        lua-ls = { enable = true; };
        nil-ls = { enable = true; };
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
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
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
  keymaps = [
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>Telescope lsp_definitions<cr>";
      options = {
        desc = "Goto Definition";
      };
    }
    {
      mode = "n";
      key = "<leader>gr";
      action = "<cmd>Telescope lsp_references<cr>";
      options = {
        desc = "Goto References";
      };
    }
    {
      mode = "n";
      key = "<leader>gI";
      action = "<cmd>Telescope lsp_implementations<cr>";
      options = {
        desc = "Goto Implementations";
      };
    }
    {
      mode = "n";
      key = "<leader>gT";
      action = "<cmd>Telescope lsp_type_definitions<cr>";
      options = {
        desc = "Goto Type Definitions";
      };
    }
  ];
}
