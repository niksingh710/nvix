{ config, helpers, ... }:
let inherit (config.nvix.mkKey) mkKeymap wKeyObj;
in {
  keymaps = [
    (mkKeymap "n" "<leader>st" "<cmd>TodoTelescope theme=ivy<cr>" "Todo")
    (mkKeymap "n" "<leader>su" "<cmd>Telescope undo layout_strategy=vertical layout_config={preview_height=0.7,height=0.8,prompt_position='top'}<cr>" "Undo")
    (mkKeymap "n" "<leader>sT" "<cmd>TodoTelescope theme=ivy keywords=TODO,FIX,FIXME<cr>" "Todo/Fix/Fixme")
    (mkKeymap "n" "<leader>sc" "<cmd>Telescope builtin theme=dropdown previewer=false<cr>" "Telescope Commands")
    (mkKeymap "n" "<leader>sh" "<cmd>Telescope help_tags<cr>" "Help Pages")
    (mkKeymap "n" "<leader>sk" "<cmd>Telescope keymaps<cr>" "Key Maps")

    (mkKeymap "n" "]t"
      (helpers.mkRaw # lua
        ''
          function() require("todo-comments").jump_next() end
        '')
      "Next Todo Comment")
    (mkKeymap "n" "[t"
      (helpers.mkRaw # lua
        ''
          function() require("todo-comments").jump_prev() end
        '')
      "Previous Todo Comment")

    (mkKeymap "n" "<leader>fb"
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>"
      "Switch Buffer")
    (mkKeymap "n" "<leader>:" "<cmd>Telescope command_history<cr>"
      "Command History")

    (mkKeymap "n" "<leader>ff" "<cmd>Telescope find_files<cr>"
      "Find Files (Root Dir)")
    (mkKeymap "n" "<leader>f/" "<cmd>Telescope live_grep<cr>" "Grep (cwd)")
    (mkKeymap "n" "<leader>fr" "<cmd>Telescope oldfiles<cr>" "Recent Files")
    (mkKeymap "n" "<leader>fg" "<cmd>Telescope git_files<CR>"
      "Find Files (git-files)")

  ];

  wKeyList = [
    (wKeyObj [ "<leader>:" "" "" true ])
    (wKeyObj [ "<leader>s" "" "search" ])
    (wKeyObj [ "<leader>f" "" "file/find" ])

  ];
}
