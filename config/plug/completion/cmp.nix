{
  plugins = {
    cmp-emoji = { enable = true; };
    cmp =
      let
        default_sources = [
          { name = "nvim_lsp"; }
          { name = "emoji"; }
          {
            name = "buffer"; # text within current buffer
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          { name = "copilot"; }
          {
            name = "path"; # file system paths
            keywordLength = 3;
          }
          {
            name = "luasnip"; # snippets
            keywordLength = 3;
          }
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
          snippet = { expand = "luasnip"; };
          formatting = { fields = [ "kind" "abbr" "menu" ]; };
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
                  [ 'Down' ] = cmp.mapping.select_next_item(),
                  [ 'Up' ] = cmp.mapping.select_prev_item(),
              })
            '';
          };
        };
        filetype =
          let
            sql_sources =
              [
                { name = "vim-dadbod-completion"; }
              ]
              ++ default_sources;
          in
          {
            sql = { sources = sql_sources; };
            mysql = { sources = sql_sources; };
            plsql = { sources = sql_sources; };
            toml.sources =
              [
                { name = "crates"; }
              ]
              ++ default_sources;
          };
      };
    cmp-nvim-lsp = { enable = true; }; # lsp
    cmp-buffer = { enable = true; };
    cmp-path = { enable = true; }; # file system paths
    cmp_luasnip = { enable = true; }; # snippets
    cmp-cmdline = { enable = false; }; # autocomplete for cmdline
  };
  extraConfigLua = ''
        luasnip = require("luasnip")
        kind_icons = {
          Text = "󰊄",
          Method = "",
          Function = "󰡱",
          Constructor = "",
          Field = "",
          Variable = "󱀍",
          Class = "",
          Interface = "",
          Module = "󰕳",
          Property = "",
          Unit = "",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "",
          Event = "",
          Operator = "",
          TypeParameter = "",
        } 

         local cmp = require'cmp'

     -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
     cmp.setup.cmdline({'/', "?" }, {
       sources = {
         { name = 'buffer' }
       }
     })

    -- Set configuration for specific filetype.
     cmp.setup.filetype('gitcommit', {
       sources = cmp.config.sources({
         { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
       }, {
         { name = 'buffer' },
       })
     })

     -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
     cmp.setup.cmdline(':', {
       sources = cmp.config.sources({
         { name = 'path' }
       }, {
         { name = 'cmdline' }
       }),
      --      formatting = {
      --       format = function(_, vim_item)
      --         vim_item.kind = cmdIcons[vim_item.kind] or "FOO"
      --       return vim_item
      --      end
      -- }
     })  
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


