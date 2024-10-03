{ lib, mkKey, ... }:
let inherit (mkKey) mkKeymap;
in with lib; {
  plugins.lsp = {
    enable = mkDefault true;
    inlayHints = mkDefault true;
    servers.nil-ls = {
      enable = true;
      settings = {
        formatting.command = [ "nixpkgs-fmt" ];
      };

    };
  };

  keymaps = [
    (mkKeymap "v" "<leader>lf" { __raw = "vim.lsp.buf.format "; }
      "Format file")
    (mkKeymap "x" "<leader>lf" { __raw = "vim.lsp.buf.format"; }
      "Format file")
    (mkKeymap "n" "<leader>lf" { __raw = "vim.lsp.buf.format"; }
      "Format file")
  ];
}
