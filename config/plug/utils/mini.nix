{
  plugins.mini = {
    enable = true;
    modules = {
      ai = { };
      surround = {
        mappings = {
          add = "gsa";
          delete = "gsd";
          replace = "gsr";
          update_n_lines = "gsn";
        };
      };
      sessions = {
        autoread = true;
        autowrite = true;
      };
    };
  };
}
