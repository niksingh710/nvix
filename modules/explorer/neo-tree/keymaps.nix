{ config, lib, ... }:
let
  inherit (config.nvix.mkKey) mkKeymap;
in
{
  keymaps = lib.optionals config.nvix.explorer.neo-tree [
    (mkKeymap "n" "<leader>e" "<cmd>:Neotree reveal toggle<cr>" "Neo Tree Explorer")
  ];
}
