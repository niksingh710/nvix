{ inputs, mkPkgs, mkKey, specObj, ... }:
let inherit (mkKey) mkKeymap;
in {
  plugins.bufferline = {
    enable = true;
    settings.options = {
      diagnostics = "nvim_lsp";
      truncateNames = true;
      offsets = [
        {
          filetype = "undotree";
          text = "Undotree";
          highlight = "PanelHeading";
          padding = 1;
        }
        {
          filetype = "neo-tree";
          text = "Explorer";
          highlight = "PanelHeading";
          padding = 1;
        }
        {
          filetype = "NvimTree";
          text = "Explorer";
          highlight = "PanelHeading";
          padding = 1;
        }
        {
          filetype = "DiffviewFiles";
          text = "Diff View";
          highlight = "PanelHeading";
          padding = 1;
        }
        {
          filetype = "flutterToolsOutline";
          text = "Flutter Outline";
          highlight = "PanelHeading";
        }
      ];
    };
  };
  extraPlugins = [ (mkPkgs "buffer_manager" inputs.buffer-manager) ];

  wKeyList = [ (specObj [ "<leader>b" "" "buffers" ]) ];
  keymaps = [
    (mkKeymap "n" "<leader>bm"
      ":lua require('buffer_manager.ui').toggle_quick_menu()<cr>"
      "Buffer Manager")

    (mkKeymap "n" "<leader>bp" "<cmd>:BufferLinePick<cr>" "Buffer Line Pick")
    (mkKeymap "n" "<cmd>:bp | bd #<cr>" "<leader>bc" "Buffer Delete")

    (mkKeymap "n" "<leader>bP" "<cmd>BufferLineTogglePin<cr>" "Buffer Pin")
    (mkKeymap "n" "<leader>bd" "<cmd>BufferLineSortByDirectory<cr>"
      "Buffer Sort by dir")
    (mkKeymap "n" "<leader>be" "<cmd>BufferLineSortByExtension<cr>"
      "Buffer Sort by ext")
    (mkKeymap "n" "<leader>bt" "<cmd>BufferLineSortByTabs<cr>"
      "Buffer Sort by Tabs")
    (mkKeymap "n" "<leader>bL" "<cmd>BufferLineCloseRight<cr>"
      "Buffer close all to right")
    (mkKeymap "n" "<leader>bH" "<cmd>BufferLineCloseLeft<cr>"
      "Buffer close all to left")
    (mkKeymap "n" "<leader>bc" "<cmd>BufferLineCloseOther<cr>"
      "Buffer close all except the current buffer")
    (mkKeymap "n" "<a-s-h>" "<cmd>BufferLineMovePrev<cr>" "Move buffer to left")
    (mkKeymap "n" "<a-s-l>" "<cmd>BufferLineMoveNext<cr>" "Move buffer to right")
 
  ];
}
