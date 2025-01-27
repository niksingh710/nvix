{ helpers, pkgs, lib, ... }:
{
  plugins = {
    todo-comments.enable = true;
    telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        undo.enable = true;
      };
      settings = {
        pickers = {
          find_files = {
            hidden = true;
            find_command = helpers.listToUnkeyedAttrs [ "${lib.getExe pkgs.ripgrep}" "--files" "--color" "never" "-g" "!.git" ];
          };
          colorscheme.enable_preview = true;
        };
        defaults = {
          mappings = {
            n = {
              q = helpers.mkRaw "require('telescope.actions').close";
              s = helpers.mkRaw "require('telescope.actions').select_horizontal";
              v = helpers.mkRaw "require('telescope.actions').select_vertical";
            };
          };
        };
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
