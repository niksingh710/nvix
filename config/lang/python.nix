{ pkgs, ... }: {
  plugins = {
    lsp = {
      servers = {
        ruff.enable = true;
        ruff-lsp.enable = true;
      };
    };
    none-ls = {
      sources = {
        formatting.black.enable = true;
        diagnostics = { mypy.enable = true; };
      };
    };
  };

  extraPackages = with pkgs; [ 
    sourcery
  ];
  # TODO: sops for token
  extraConfigLua = # lua
    ''
      -- local lspconfig = require('lspconfig')
      -- lspconfig.sourcery.setup {
      --   -- Server-specific settings. See `:help lspconfig-setup`
      --   settings = {
      --     ['sourcery'] = {
      --       init_options = {
      --         token = "<to be placed by sops.nix>",
      --         extension_version = "vim.lsp",
      --         editor_version = "vim",
      --       },
      --     },
      --   },
      -- }
    '';
}
