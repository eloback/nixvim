{
  plugins.noice = {
    enable = true;
    notify = {
      enabled = false;
    };
    messages = {
      enabled = true; # Adds a padding-bottom to neovim statusline when set to false for some reason
    };
    lsp = {
      message = {
        enabled = true;
      };
      progress = {
        enabled = false;
        view = "mini";
      };
    };
    popupmenu = {
      enabled = true;
      backend = "nui";
    };
    cmdline = {
      enabled = true;
      view = "cmdline_popup";
    };
    format = {
      filter = {
        pattern = [ ":%s*%%s*s:%s*" ":%s*%%s*s!%s*" ":%s*%%s*s/%s*" "%s*s:%s*" ":%s*s!%s*" ":%s*s/%s*" ];
        icon = "";
        lang = "regex";
      };
      replace = {
        pattern = [ ":%s*%%s*s:%w*:%s*" ":%s*%%s*s!%w*!%s*" ":%s*%%s*s/%w*/%s*" "%s*s:%w*:%s*" ":%s*s!%w*!%s*" ":%s*s/%w*/%s*" ];
        icon = "󱞪";
        lang = "regex";
      };
    };
    views = {
      cmdline_popup = {
        border = {
          style = "none";
          padding = [ 1 1 ];
        };
        filter_options = { };
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder";
        };
      };
      # popupmenu = {
      #   relative = "editor";
      #   position = {
      #     row = 8;
      #     col = "50%";
      #   };
      #   size = {
      #     width = 60;
      #     height = 10;
      #   };
      #   border = {
      #     style = "rounded";
      #     padding = [ 0 1 ];
      #   };
      #   win_options = {
      #     winhighlight = { Normal = "Normal"; FloatBorder = "DiagnosticInfo"; };
      #   };
      # };
    };
  };
}
