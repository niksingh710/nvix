{
  plugins = {
    lsp.servers = {
      nixd = {
        enable = true;
        settings = {
          nixpkgs.expr = "import <nixpkgs> {}";
          formatting.command = [ "nixpkgs-fmt" ];
        };
      };
      statix.enable = true;
    };
  };
}
