{ config, helpers, ... }:
let
  inherit (config.nvix.mkKey) mkKeymap;
in
{
  keymaps = [
    (mkKeymap "n" "<c-a-h>" ":lua require('smart-splits').resize_left()<cr>" "Resize Left")
    (mkKeymap "n" "<c-a-j>" ":lua require('smart-splits').resize_down()<cr>" "Resize Down")
    (mkKeymap "n" "<c-a-k>" ":lua require('smart-splits').resize_up()<cr>" "Resize Up")
    (mkKeymap "n" "<c-a-l>" ":lua require('smart-splits').resize_right()<cr>" "Resize Right")
    (mkKeymap "n" "?" (helpers.mkRaw # lua
      ''
        function()
          require('flash').jump({
            forward = true, wrap = true, multi_window = true
          })
          end
      ''
    ) "Flash Search")

    (mkKeymap "n" "<c-h>" ":lua require('smart-splits').move_cursor_left()<cr>" "Move Cursor Left")
    (mkKeymap "n" "<c-j>" ":lua require('smart-splits').move_cursor_down()<cr>" "Move Cursor Down")
    (mkKeymap "n" "<c-k>" ":lua require('smart-splits').move_cursor_up()<cr>" "Move Cursor Up")
    (mkKeymap "n" "<c-l>" ":lua require('smart-splits').move_cursor_right()<cr>" "Move Cursor Right")
    (mkKeymap "n" "<c-\\>" ":lua require('smart-splits').move_cursor_previous()<cr>"
      "Move Cursor Previous"
    )
  ];
}
