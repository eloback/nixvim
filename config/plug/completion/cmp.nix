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
          formatting = { fields = [ "kind" "abbr" "menu" ]; };
          snippet = { expand = "function(args) require('luasnip').lsp_expand(args.body) end"; };
          sources = default_sources;

          window = {
            completion = { border = "solid"; };
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
    luasnip = require("luasnip")
    local cmp = require'cmp'
    DEBUG_ICON = false
    cmp.setup {
      formatting = {
        format = function(entry, vim_item)
          local kind_icons = {
            Version = "",
            Feature = "",
            Copilot = "",
            Text = "",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰇽",
            Variable = "󰂡",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "󰅲",
          }
          local custom_menu_icon = {
            calc = " 󰃬 ",
            cmdline = " 󰏓 ",
            --NOTE: requires a nerdfont to be rendered
            --you could include other sources here as well
          }

          local icon = "?"

          if kind_icons[vim_item.kind] ~= nil then
            icon = kind_icons[vim_item.kind]
          end
          if entry.source.name == "calc" then
            -- Get the custom icon for 'calc' source
            -- Replace the kind glyph with the custom icon
            icon = custom_menu_icon.calc
          elseif entry.source.name == "cmdline" then
            -- Get the custom icon for 'cmdline' source
            -- Replace the kind glyph with the custom icon
            icon = custom_menu_icon.cmdline
          end
          if DEBUG_ICON then
            icon = string.format('[%s][%s]', entry.source.name, vim_item.kind)
          end
          vim_item.kind = string.format(' %s ', icon)
          return vim_item
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
