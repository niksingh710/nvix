{
  plugins = {
    rustaceanvim.enable = true;
    crates-nvim.enable = true;
  };
  extraConfigLua = # lua
    ''
      require("crates").setup({
              autoupdate = true,
            })
            require("crates").show()
    '';
}
