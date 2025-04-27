{ config, ... }:
let
  inherit (config.nvix.mkKey) mkKeymap;
in
{
  plugins.otter = {
    enable = false;
    settings.buffers = {
      set_filetype = true;
    };
  };

  plugins.lsp.keymaps.extra = [
    (mkKeymap "n" "<leader>lO" "<cmd>lua require('otter').activate()<cr>" "Force Otter")
  ];

}
