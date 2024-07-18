{
  plugins.lspkind = {
    enable = true;
    symbolMap = {
      Copilot = " ";
      Version = " ";
      Feature = " ";
      # Text = " ";
      Method = " ";
      Function = " ";
      Constructor = " ";
      Field = " ";
      Variable = " ";
      Class = " ";
      Interface = " ";
      Module = " ";
      Property = " ";
      Unit = " ";
      Enum = " ";
      Value = " ";
      Keyword = "󰌋 ";
      Snippet = " ";
      Color = " ";
      File = " ";
      Reference = " ";
      Folder = " ";
      EnumMember = "󰜢 ";
      Constant = "󰏿 ";
      Struct = " ";
      Event = " ";
      Operator = " ";
      TypeParameter = " ";
    };
    mode = "symbol_text";
    extraOptions = {
      preset = "default";
      maxwidth = 50;
      ellipsis_char = "...";
    };
  };
}
