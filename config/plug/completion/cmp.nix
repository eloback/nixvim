{
  plugins = {
    cmp-emoji = { enable = true; };
    cmp =
      let
        default_sources = [
          { name = "calc"; keywordLength = 3; }
          { name = "nvim_lsp"; }
          {
            name = "luasnip"; # snippets
            keywordLength = 3;
          }
          {
            name = "path"; # file system paths
            keywordLength = 3;
          }
          {
            name = "buffer"; # text within current buffer
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          { name = "copilot"; }
        ];
      in
      {
        enable = true;
        settings = {
          autoEnableSources = true;
          experimental = { ghost_text = true; };
          performance = {
            debounce = 60;
            fetchingTimeout = 200;
            maxViewEntries = 30;
          };
          formatting = { fields = [ "abbr" "kind" "menu" ]; };
          snippet = { expand = "function(args) require('luasnip').lsp_expand(args.body) end"; };
          sources = default_sources;

          window = {
            completion = {
              border = "solid";
              winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None";
              # col_offset = -3;
              side_padding = 0;
            };
            documentation = { border = "solid"; };
          };

          mapping = {
            __raw = ''
              cmp.mapping.preset.insert({
                  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-f>'] = cmp.mapping.scroll_docs(4),
                  ['<C-Space>'] = cmp.mapping.complete(),
                  ['<C-CR>'] = cmp.mapping.abort(),
                  ['<CR>'] = cmp.mapping.confirm({ select = true }),
                  [ '<Down>' ] = cmp.mapping.select_next_item(),
                  [ '<Up>' ] = cmp.mapping.select_prev_item(),
              })
            '';
          };
        };
        filetype =
          let
            sql_sources =
              default_sources
              ++
              [
                { name = "vim-dadbod-completion"; }
              ];
          in
          {
            sql = { sources = sql_sources; };
            mysql = { sources = sql_sources; };
            plsql = { sources = sql_sources; };
          };
        cmdline = {
          "/" = {
            mapping = {
              __raw = "cmp.mapping.preset.cmdline()";
            };
            sources = [
              {
                name = "buffer";
              }
            ];
          };
          ":" = {
            mapping = {
              __raw = "cmp.mapping.preset.cmdline()";
            };
            sources = [
              {
                name = "cmdline";
              }
            ];
          };
        };
      };
  };
  extraConfigLua = /* lua */''
    
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
    

    luasnip = require("luasnip")
    local cmp = require'cmp'
    DEBUG_MODE = false
    cmp.setup {
      formatting = {
        format = function(entry, vim_item)
          local custom_menu_icon = {
            calc = "󰃬",
            cmdline = "󰏓",
            --NOTE: requires a nerdfont to be rendered
            --you could include other sources here as well
          }

          local kind = require("lspkind").cmp_format()(entry, vim_item)

          local icon = "?"
          local menu = "?"

          if DEBUG_MODE then
            icon = entry.source.name
            menu = string.format("(%s|%s)", vim_item.kind, vim_item.menu)
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
            menu = strings[2] or vim_item.kind
          end

          kind.kind = " " .. (icon) .. " "
          kind.menu = "(" .. (menu) .. ")"

          return kind
        end
      },
    }

    -- Allow the removal of any source by name
    function remove_source(source_name)
      local config = cmp.get_config()
      for i, source in ipairs(config.sources) do
        if source.name == source_name then
          print("Disabling source: " .. source_name)
          table.remove(config.sources, i)
          break
        end
      end
      cmp.setup(config)
    end

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  '';
  keymaps = [
    # disable cmp for buffer
    {
      mode = "n";
      key = "<leader>cmpbd";
      action = "lua require\"cmp\".setup.buffer { completion = { autocomplete = false } }";
      options = {
        desc = "disable cmp for buffer";
      };
    }
  ];
}
