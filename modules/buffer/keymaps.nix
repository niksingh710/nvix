{ config, helpers, ... }:
let
  inherit (config.nvix.mkKey) mkKeymap wKeyObj;
in
{

  wKeyList = [
    (wKeyObj [
      "<leader>b"
      ""
      "buffers"
    ])
    (wKeyObj [
      "<leader><tab>"
      ""
      "tabs"
    ])
  ];

  keymaps = [
    (mkKeymap "n" "<leader>b." (helpers.mkRaw # lua
      ''
        function()
          harpoon = require("harpoon")
          harpoon:list():add()
        end
      ''
    ) "Add File to Harpoon")
    (mkKeymap "n" "<leader>bm" "<cmd>:lua require('buffer_manager.ui').toggle_quick_menu()<cr>"
      "Buffer Manager"
    )
    (mkKeymap "n" "<leader>bb" (helpers.mkRaw # lua
      ''
        function()
          harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end
      ''
    ) "Harpoon ui")

    (mkKeymap "n" "<leader>bp" "<cmd>:BufferLinePick<cr>" "Buffer Line Pick")
    (mkKeymap "n" "<leader>qc" "<cmd>:bp | bd #<cr>" "Buffer close")

    (mkKeymap "n" "<leader>bP" "<cmd>BufferLineTogglePin<cr>" "Buffer Pin")
    (mkKeymap "n" "<leader>bd" "<cmd>BufferLineSortByDirectory<cr>" "Buffer Sort by dir")
    (mkKeymap "n" "<leader>be" "<cmd>BufferLineSortByExtension<cr>" "Buffer Sort by ext")
    (mkKeymap "n" "<leader>bt" "<cmd>BufferLineSortByTabs<cr>" "Buffer Sort by Tabs")
    (mkKeymap "n" "<leader>bL" "<cmd>BufferLineCloseRight<cr>" "Buffer close all to right")
    (mkKeymap "n" "<leader>bH" "<cmd>BufferLineCloseLeft<cr>" "Buffer close all to left")
    (mkKeymap "n" "<leader>bc" "<cmd>BufferLineCloseOther<cr>"
      "Buffer close all except the current buffer"
    )
    (mkKeymap "n" "<a-s-h>" "<cmd>BufferLineMovePrev<cr>" "Move buffer to left")
    (mkKeymap "n" "<a-s-l>" "<cmd>BufferLineMoveNext<cr>" "Move buffer to right")

    (mkKeymap "n" "<s-h>" ":BufferLineCyclePrev<cr>" "Buffer Previous")
    (mkKeymap "n" "<s-l>" ":BufferLineCycleNext<cr>" "Buffer Next")

    (mkKeymap "n" "<leader><tab>j" "<cmd>tabn<cr>" "Next Tab")
    (mkKeymap "n" "<leader><tab>k" "<cmd>tabp<cr>" "Previous Tab")
    (mkKeymap "n" "<leader><tab>l" "<cmd>tabn<cr>" "Next Tab")
    (mkKeymap "n" "<leader><tab>h" "<cmd>tabp<cr>" "Previous Tab")

    (mkKeymap "n" "<leader><tab>q" "<cmd>tabclose<cr>" "Close Tab")
    (mkKeymap "n" "<leader><tab>n" "<cmd>tabnew<cr>" "New Tab")
  ];

}
