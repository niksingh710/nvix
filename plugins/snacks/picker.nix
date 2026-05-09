{ lib, ... }:
let
  inherit (lib.nixvim) utils mkRaw;
in
{
  plugins.snacks.settings.picker =
    let
      keys = {
        "<c-d>" = (utils.listToUnkeyedAttrs [ "preview_scroll_down" ]) // {
          mode = "n";
        };
        "<c-u>" = (utils.listToUnkeyedAttrs [ "preview_scroll_up" ]) // {
          mode = "n";
        };
        "-" = (utils.listToUnkeyedAttrs [ "edit_split" ]) // {
          mode = "n";
        };
        "|" = (utils.listToUnkeyedAttrs [ "edit_vsplit" ]) // {
          mode = "n";
        };
      };
    in
    {
      enabled = true;
      layout.preset = "ivy";
      layouts.vscode.layout.width = 0.7;
      actions.pick_win = mkRaw ''
        function(picker)
          if not picker.layout.split then
            picker.layout:hide()
          end
          local win = Snacks.picker.util.pick_win {
            main = picker.main,
            float = false,
            filter = function(_, buf)
              local ft = vim.bo[buf].ft
              return ft == 'snacks_dashboard' or not ft:find '^snacks'
            end,
          }
          if not win then
            if not picker.layout.split then
              picker.layout:unhide()
            end
            return true
          end
          picker.main = win
          if not picker.layout.split then
            vim.defer_fn(function()
              if not picker.closed then
                picker.layout:unhide()
              end
            end, 100)
          end
        end
      '';
      win = {
        input.keys = keys;
        list.keys = keys // {
          "<Enter>" =
            # lua
            mkRaw ''
              { { "pick_win", "jump" }, mode = { "n", "i" } }
            '';
        };
      };
    };

}
