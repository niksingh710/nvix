# This file contains plugins that are basics or don't need their own file
{ inputs, mkPkgs, mkKey, ... }:
let inherit (mkKey) mkKeymap;
in {
  # Keeping this at top so that if any plugin is removed it's respective config can be removed
  extraConfigLua = # lua
    ''
      require("windows").setup()
    '';
  keymaps =
    [ (mkKeymap "n" "<c-w>=" "<cmd>WindowsEqualize<CR>" "Equalize windows") ];
  extraPlugins = [
    (mkPkgs "windows" inputs.windows)
    (mkPkgs "windows-mc" inputs.windows-mc)
    (mkPkgs "windows-a" inputs.windows-a)
  ];
  plugins = {

    # TODO: add multicursor

    nvim-surround.enable = true;
    dressing.enable = true;
    lastplace.enable = true;
    oil.enable = true;

    fidget = {
      enable = true;
      progress.display.progressIcon.pattern = "moon";
      notification.window = {
        relative = "editor";
        winblend = 0;
        border = "none";
      };
    };
  };
}
