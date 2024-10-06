{
  plugins.lsp.servers = {
    ruff.enable = true;
    pyright = {
      enable = true;
      settings = {
        pyright.disableOrganizeImports = true;
        python.analysis.ignore = [ "*" ];
      };
    };
  };
}
