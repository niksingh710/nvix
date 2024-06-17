{
  plugins = {
    ltex-extra.enable = true;
    vimtex.enable = true;
  };
  extraConfigLua = # lua
    ''
      vim.cmd([[let maplocalleader = " t"]])
    '';
}
