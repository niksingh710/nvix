{ lib, ... }:
{
  plugins.auto-session = {
    enable = true;
    settings = {
      auto_save = true;
      auto_restore = false;
    };
  };

  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}")) (attrNames (readDir ./.))
    );
}
