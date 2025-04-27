{
  inputs,
  pkgs,
  config,
  ...
}:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "oil-lsp-diagnostics";
      src = inputs.oil-lsp-diagnostics;
      dependencies = [ config.plugins.oil.package ];
    })
  ];
  extraConfigLua = # lua
    ''
      require "oil-lsp-diagnostics".setup()
    '';
}
