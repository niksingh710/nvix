{ lib, ... }:
{
  plugins.copilot-lua = {
    enable = true;
    settings = {
      filetypes.markdown = true;
      suggestion = {
        enabled = true;
        auto_trigger = true;
      };
    };
  };

  imports = with builtins; with lib;
    map (fn: ./${fn})
      (filter
        (fn: (
          fn != "default.nix"
          && !hasSuffix ".md" "${fn}"
        ))
        (attrNames (readDir ./.)));
}
