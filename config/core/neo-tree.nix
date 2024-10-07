{ mkKey, mkPkgs, helpers, icons, specObj, inputs, ... }:
let inherit (mkKey) mkKeymap;
in {
  wKeyList = [ (specObj [ "<leader>e" "" ]) ];

  extraPlugins = [
    (mkPkgs "nvim-window-picker" inputs.nvim-window-picker)
  ];

  extraConfigLua = ''
    require('window-picker').setup({
      hint = 'floating-big-letter'
    })
  '';

  plugins.neo-tree = {
    enable = true;

    usePopupsForInput = false;

    extraSources = [ "document_symbols" ];
    sourceSelector.winbar = true;
    buffers.followCurrentFile.enabled = true;
    filesystem.window.mappings."F" = "fuzzy_finder_directory";
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
        "s" = "open_split";
        "v" = "open_vsplit";
        "l" = "open_with_window_picker";
        "<cr>" = "open_with_window_picker";
        "<C-d>" = {
          command = "scroll_preview";
          config.direction = -10;
        };
        "<C-u>" = {
          command = "scroll_preview";
          config.direction = 10;
        };
        "<space>" = "none";
        "K" = "focus_preview";
        "P" = {
          command = "toggle_preview";
          config.use_float = true;
        };
      };
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>e"
      (helpers.mkRaw # lua
        ''
          function()
            require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
          end
        '')
      "Explorer NeoTree (cwd)")
  ];
}
