{
  lib,
  pkgs,
  helpers,
  config,
  ...
}:
let
  inherit (config.nvix) icons;
in
{
  options.nvix.explorer.neo-tree = lib.mkEnableOption "Enable NeoTree" // {
    default = true;
  };
  config = {
    extraPlugins = with pkgs.vimPlugins; [ nvim-window-picker ];
    extraConfigLua = # lua
      ''
        require('window-picker').setup({
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            bo = {
              filetype = { 'neo-tree', "neo-tree-popup", "notify" },
              buftype = { 'terminal', "quickfix" },
            },
          },
        })
      '';
    plugins = {
      bufferline.settings.options.offsets = [
        {
          filetype = "neo-tree";
          text = "Explorer";
          highlight = "PanelHeading";
          padding = 1;
        }
      ];
      neo-tree = {
        enable = config.nvix.explorer.neo-tree;
        usePopupsForInput = false;
        popupBorderStyle = config.nvix.border;
        sourceSelector.winbar = true;
        extraSources = [ "document_symbols" ];
        filesystem.followCurrentFile.enabled = true;
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
          position = "right";
          mappings = {
            "f" =
              helpers.mkRaw # lua
                ''
                  function(state)
                    local node = state.tree:get_node()
                    local path = node:get_id()
                    Snacks.picker.files({ cwd = path })
                  end
                '';
            "/" =
              helpers.mkRaw # lua
                ''
                  function(state)
                    local node = state.tree:get_node()
                    local path = node:get_id()
                    Snacks.picker.grep({ cwd = path })
                  end
                '';
            "s" = "open_split";
            "v" = "open_vsplit";
            "l" = "open_with_window_picker";
            "h" =
              helpers.mkRaw # lua
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
    };
  };
  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}")) (attrNames (readDir ./.))
    );
}
