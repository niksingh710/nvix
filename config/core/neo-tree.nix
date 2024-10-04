{ mkKey, icons, specObj, ... }:
let inherit (mkKey) mkKeymap;
in {
  wKeyList = [ (specObj [ "<leader>e" "" ]) ];
  plugins.neo-tree = {
    enable = true;

    usePopupsForInput = false;

    extraSources = [ "document_symbols" ];
    sourceSelector.winbar = true;
    buffers.followCurrentFile.enabled = true;
    filesystem.window.mappings = { "F" = "fuzzy_finder_directory"; };
    defaultComponentConfigs = {
      diagnostics.symbols = {
        hint = "${icons.diagnostics.BoldHint}";
        info = "${icons.diagnostics.BoldInformation}";
        warn = "${icons.diagnostics.BoldWarning}";
        error = "${icons.diagnostics.BoldError}";
      };
      gitStatus.symbols = {
        unstaged = "${icons.git.FileUnstaged}";
        staged = "${icons.git.FileStaged}";
        renamed = "${icons.git.FileRenamed}";
        untracked = "${icons.git.FileUntracked}";
        deleted = "${icons.git.FileDeleted}";
        ignored = "${icons.git.FileIgnored}";
      };
    };
    window = {
      position = "right";
      autoExpandWidth = true;
      mappings = {
        "s" = "split_with_window_picker";
        "v" = "vsplit_with_window_picker";
        "l" = "open";
        "h" = "close_node";
        "<space>" = "none";
        "P" = {
          command = "toggle_preview";
          config = { use_float = true; };
        };
      };
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>e"
      {
        __raw = # lua
          ''
            function()
              require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
            end
          '';
      } "Explorer NeoTree (cwd)")
  ];
}
