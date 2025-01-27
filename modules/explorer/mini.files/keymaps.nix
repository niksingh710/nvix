{ config, lib, ... }:
let inherit (config.nvix.mkKey) mkKeymap;
in {
  keymaps = lib.optionals config.nvix.explorer.mini [
    (mkKeymap "n" "<leader>e" "<cmd>:lua MiniFiles.open()<cr>" "Mini Explorer")
  ];

}
