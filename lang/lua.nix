{
  plugins = {
    lsp.servers.lua_ls = {
      enable = true;
      settings.diagnostics = {
        disable = [ "miss-name" ];
        globals = [
          "vim"
          "cmp"
          "Snacks"
        ];
      };
    };
    conform-nvim.settings = {
      formatters_by_ft.lua = [ "stylua" ];
      formatters.stylua = {
        # If a command is string then it will execute the system's stylua binary
        command = "stylua";
      };
    };
  };
}
