{ lib, mkKey, icons, opts, specObj, pkgs, ... }:
let inherit (mkKey) mkKeymap;
in with lib; {
  plugins = {
    conform-nvim = {
      enable = mkDefault true;
      settings = {
        formatters.nixpkgs-fmt = {
          command = lib.getExe pkgs.nixpkgs-fmt;
        };
        formatters_by_ft.nix = [ "nixpkgs-fmt" ];
      };
    };
    lsp = {
      enable = mkDefault true;
      inlayHints = mkDefault true;
      servers.nil-ls = {
        enable = true;
        settings = {
          formatting.command = [ "nixpkgs-fmt" ];
        };
      };
    };
  };

  extraConfigLua = # lua
    ''
      vim.keymap.set("n", "<leader>lf", function() require("conform").format() end, { noremap = true, silent = true, desc = "Format Buffer" })
      vim.keymap.set("v", "<leader>lf", function() require("conform").format() { async = true } end, { noremap = true, silent = true, desc = "Format Buffer" })
      vim.keymap.set("x", "<leader>lf", function() require("conform").format() { async = true } end, { noremap = true, silent = true, desc = "Format Buffer" })

    '';

  wKeyList = [
    (specObj [ "<leader>l" "󰿘" "lsp" ])
  ];
}
