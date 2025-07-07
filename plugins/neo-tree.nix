{ pkgs, config, lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
  inherit (config.nvix) icons;
  inherit (config.nvix.mkKey) mkKeymap wKeyObj;
in
{
  keymaps = [
    (mkKeymap "n" "<leader>e" "<cmd>:Neotree reveal toggle<cr>" "Neo Tree Explorer")
  ];

  wKeyList = [
    (wKeyObj [ "<leader>e" "󰙅" "Neo Tree" ])
  ];

  extraPlugins = with pkgs.vimPlugins; [ nvim-window-picker ];
  extraConfigLua = # lua
    ''
      require('window-picker').setup({
        filter_rules = {
          autoselect_one = true,
          bo = {
            filetype = { 'neo-tree', "neo-tree-popup", "notify" },
            buftype = { 'terminal', "quickfix" },
          },
        },
      })
    '';
  plugins.neo-tree = {
    enable = true;
    usePopupsForInput = false;
    popupBorderStyle = config.nvix.border;
    filesystem = {
      useLibuvFileWatcher = true;
      followCurrentFile.enabled = true;
    };
    defaultComponentConfigs = {
      gitStatus.symbols = with icons.git; {
        unstaged = "${FileUnstaged}";
        staged = "${FileStaged}";
        renamed = "${FileRenamed}";
        untracked = "${FileUntracked}";
        deleted = "${FileDeleted}";
        ignored = "${FileIgnored}";
      };
    };
    window = {
      width = 40;
      position = "right";
      mappings = {
        "f" =
          mkRaw # lua
            ''
              function(state)
                local node = state.tree:get_node()
                local path = node:get_id()
                Snacks.picker.files({ cwd = path })
              end
            '';
        "/" =
          mkRaw # lua
            ''
              function(state)
                local node = state.tree:get_node()
                local path = node:get_id()
                Snacks.picker.grep({ cwd = path })
              end
            '';
        "-" = "open_split";
        "|" = "open_vsplit";
        "l" = "open_with_window_picker";
        "h" =
          mkRaw # lua
            ''
              function(state)
                local node = state.tree:get_node()
                if node.type == 'directory' and node:is_expanded() then
                  require'neo-tree.sources.filesystem'.toggle_directory(state, node)
                else
                  require'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
                end
              end
            '';
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
  plugins.bufferline.settings.options.offsets = [
    {
      filetype = "neo-tree";
      text = "Explorer";
      highlight = "PanelHeading";
      padding = 1;
    }
  ];
}
