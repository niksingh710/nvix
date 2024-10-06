{ mkPkgs, inputs, specObj, ... }:
{
  plugins = {
    lsp.servers.ltex.enable = true;
    ltex-extra.enable = true;
    vimtex.enable = true;
  };

  globals = {
    maplocalleader = " t"; # Set the local leader to "<leader>t"
  };

  wKeyList = [
    (specObj [ "<leader>t" "" "tex" ])
  ];

  extraPlugins = [
    (mkPkgs "rnoweb-nvim" inputs.rnoweb)
  ];

  extraConfigLua = # lua
    ''
      require('rnoweb-nvim').setup()
    '';
}
