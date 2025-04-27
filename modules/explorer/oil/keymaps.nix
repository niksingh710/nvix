{ config, lib, ... }:
let
  inherit (config.nvix.mkKey) mkKeymap;
in
{
  keymaps = lib.optionals config.nvix.explorer.oil [
    (mkKeymap "n" "<leader>e" "<cmd>:Oil --float --preview<cr>" "Oil Explorer")
    (mkKeymap "n" "<leader>E" "<cmd>:lua Snacks.explorer()<cr>" "Snacks Explorer")
  ];
}
