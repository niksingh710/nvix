{
  plugins = {
    lsp.servers.lua-ls.enable = true;
    conform-nvim.settings = {
      formatters_by_ft.lua = [ "stylua" ];
      formatters.stylua = {
        # If a command is string then it will execute the system's stylua binary
        command = "stylua";
      };
    };
  };
}
