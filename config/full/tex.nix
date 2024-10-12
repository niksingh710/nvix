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
    (specObj [ "<leader>tl" "" "vimtex" ])
  ];

  extraPlugins = [
    (mkPkgs "rnoweb-nvim" inputs.rnoweb)
  ];

  extraConfigLuaPre = # lua
    ''
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = ".build" -- you can set here whatever name you desire
      }
    '';

  extraConfigLua = # lua
    ''
      require('rnoweb-nvim').setup()
    '';
}
