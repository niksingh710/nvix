{ opts, lib, config, ... }: {
  options.wKeyList = lib.mkOption { type = lib.types.listOf lib.types.attrs; };
  config = {
    plugins.which-key = {
      enable = true;

      settings = {
        win.wo = { inherit (opts) winblend; };
        spec = config.wKeyList;
      };
    };
    opts = {
      timeout = true;
      timeoutlen = 250;
    };
  };
}
