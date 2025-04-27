{ lib, ... }:
{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        highlight = {
          enable = true;
          disable = [
            "latex"
            "markdown"
          ];
        };
        auto_install = true;
        incremental_selection.enable = true;
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
