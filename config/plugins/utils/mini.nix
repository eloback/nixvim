{
  plugins.mini = {
    enable = true;

    modules = {
      indentscope = {
        symbol = "│";
        options = {
          try_as_border = true;
        };
      };
      surround = {
        mappings = {
          add = "gsa";
          delete = "gsd";
          replace = "gsr";
          update_n_lines = "gsn";
        };
      };
      comment = {};
    };
  };
}
