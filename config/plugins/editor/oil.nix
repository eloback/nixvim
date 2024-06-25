{
  plugins.oil = {
    enable = true;
  };
  keymaps = [
    {
      mode = ["n"];
      key = "-";
      action = "<cmd>Oil<cr>";
      options = {desc = "Oil";};
    }
  ];
}
