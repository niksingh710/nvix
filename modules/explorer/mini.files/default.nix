{ lib, config, ... }:
{
  options.nvix.explorer.mini = lib.mkEnableOption "Enable Mini";
  config.plugins.mini.modules =
    if config.nvix.explorer.mini then {
      files.windows.preview = true;
    } else null;


  imports = with builtins; with lib;
    map
      (fn: ./${fn})
      (filter
        (fn: (
          fn != "default.nix"
          && !hasSuffix ".md" "${fn}"
        ))
        (attrNames (readDir ./.)));
}
