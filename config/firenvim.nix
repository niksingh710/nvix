{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [ firenvim ];
  extraConfigLua = # lua
    ''
      vim.fn["firenvim#install"](0)
      vim.g.firenvim_config = {
        localSettings = {
          [".*"] = {
            takeover = "never",
            cmdline = "neovim",
          },
        },
      }
    '';
}
