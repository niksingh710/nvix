{
  plugins = {
    lsp = {
      servers = {
        bashls.enable = false;
      };
    };
    none-ls = {
      sources = {
        formatting.shfmt.enable = true;
      };
    };
  };
}
