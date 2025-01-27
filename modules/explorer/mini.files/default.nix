{ lib, ... }:
{
  options.nvix.explorer.mini = lib.mkEnableOption "Enable Mini";
  config.plugins.mini.modules.files.windows.preview = true;

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
