{
  plugins.lspkind = {
    enable = true;
    symbolMap = {
      Copilot = "";
      Version = "";
      Feature = "";
      # Text = " ";
      Method = "";
      Function = "";
      Constructor = "";
      Field = "";
      Variable = "";
      Class = "";
      Interface = "";
      Module = "";
      Property = "";
      Unit = "";
      Enum = "";
      Value = "";
      Keyword = "󰌋";
      Snippet = "";
      Color = "";
      File = "";
      Reference = "";
      Folder = "";
      EnumMember = "󰜢";
      Constant = "󰏿";
      Struct = "";
      Event = "";
      Operator = "";
      TypeParameter = "";
    };
    mode = "symbol_text";
    extraOptions = {
      preset = "default";
      maxwidth = 50;
      ellipsis_char = "...";
    };
    cmp = {
      enable = true;
      after = /*lua*/''
        function(entry, vim_item)
            local custom_menu_icon = {
              calc = "󰃬",
              cmdline = "󰏓",
              --NOTE: requires a nerdfont to be rendered
              --you could include other sources here as well
            }
            local icon = "?"
            local menu = "?"

            if DEBUG_MODE then
              icon = entry.source.name
              menu = string.format("%s|%s", vim_item.kind, vim_item.menu)
            elseif entry.source.name == "calc" then
              -- Get the custom icon for 'calc' source
              -- Replace the kind glyph with the custom icon
              icon = custom_menu_icon.calc
              menu = "calc"
            elseif entry.source.name == "cmdline" then
              -- Get the custom icon for 'cmdline' source
              -- Replace the kind glyph with the custom icon
              icon = custom_menu_icon.cmdline
              menu = "command"
            else
              local strings = vim.split(kind.kind, "%s", { trimempty = true })
              icon = strings[1] or "?"
              menu = strings[2] or "unknown"
            end

            kind.kind = " " .. (icon) .. " "
            kind.menu = "(" .. (menu) .. ")"

            return kind
          end
      '';
    };
  };
  extraConfigLua = /*lua*/''
    -- Customization for Pmenu
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#f2d5cf", fg = "NONE" })
    vim.api.nvim_set_hl(0, "Pmenu", { fg = "#232634", bg = "#303446" })
    
    
    --- Group 1
    vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#ca9ee6", bg = "NONE", italic = true })

    --- Group 2
    vim.api.nvim_set_hl(0, "CmpItemKindField", { bg = "NONE", fg = "#e78284" })
    vim.api.nvim_set_hl(0, "CmpItemKindProperty", { bg = "NONE", fg = "#e78284" })
    vim.api.nvim_set_hl(0, "CmpItemKindEvent", { bg = "NONE", fg = "#e78284" })

    vim.api.nvim_set_hl(0, "CmpItemKindText", { bg = "NONE", fg = "#a6d189" })
    vim.api.nvim_set_hl(0, "CmpItemKindEnum", { bg = "NONE", fg = "#a6d189" })
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#a6d189" })

    vim.api.nvim_set_hl(0, "CmpItemKindConstant", { bg = "NONE", fg = "#e5c890" })
    vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { bg = "NONE", fg = "#e5c890" })
    vim.api.nvim_set_hl(0, "CmpItemKindReference", { bg = "NONE", fg = "#e5c890" })

    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#f4b8e4" })
    vim.api.nvim_set_hl(0, "CmpItemKindStruct", { bg = "NONE", fg = "#f4b8e4" })
    vim.api.nvim_set_hl(0, "CmpItemKindClass", { bg = "NONE", fg = "#f4b8e4" })
    vim.api.nvim_set_hl(0, "CmpItemKindModule", { bg = "NONE", fg = "#f4b8e4" })
    vim.api.nvim_set_hl(0, "CmpItemKindOperator", { bg = "NONE", fg = "#f4b8e4" })

    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#ef9f76" })
    vim.api.nvim_set_hl(0, "CmpItemKindFile", { bg = "NONE", fg = "#ef9f76" })

    vim.api.nvim_set_hl(0, "CmpItemKindUnit", { bg = "NONE", fg = "#85c1dc" })
    vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { bg = "NONE", fg = "#85c1dc" })
    vim.api.nvim_set_hl(0, "CmpItemKindFolder", { bg = "NONE", fg = "#85c1dc" })

    vim.api.nvim_set_hl(0, "CmpItemKindMethod", { bg = "NONE", fg = "#8caaee" })
    vim.api.nvim_set_hl(0, "CmpItemKindValue", { bg = "NONE", fg = "#8caaee" })
    vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { bg = "NONE", fg = "#8caaee" })

    vim.api.nvim_set_hl(0, "CmpItemKindInterface", { bg = "NONE", fg = "#81c8be" })
    vim.api.nvim_set_hl(0, "CmpItemKindColor", { bg = "NONE", fg = "#81c8be" })
    vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { bg = "NONE", fg = "#81c8be" })

    vim.api.nvim_set_hl(0, "CmpItemKindFeature", { bg = "NONE", fg = "#B7410E" })

    vim.api.nvim_set_hl(0, "CmpItemKindVersion", { bg = "NONE", fg = "#784952" })

    vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { bg = "NONE", fg = "#ff6c6b" })
  '';
}
