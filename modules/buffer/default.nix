{
  pkgs,
  inputs,
  lib,
  ...
}:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "buffer-manager";
      src = inputs.buffer-manager;
      dependencies = [ pkgs.vimPlugins.plenary-nvim ];
    })
  ];
  plugins = {
    harpoon = {
      enable = true;
    };
    bufferline = {
      enable = true;
      settings.options = {
        diagnostics = "nvim_lsp";
        always_show_bufferline = false;
      };
    };
  };

  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}")) (attrNames (readDir ./.))
    );
}
