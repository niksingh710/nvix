{ mkKey, specObj, helpers, pkgs, lib, ... }:
let inherit (mkKey) mkKeymap;
in {
  wKeyList = [
    (specObj [ "<leader>s" "" "search" ])
    (specObj [ "<leader>f" "" "file/find" ])
    (specObj [ "<leader>:" "" ])
  ];
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
          sorting_strategy = "ascending";
          layout_config.horizontal = {
            preview_width = 0.55;
            prompt_position = "top";
          };
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
  keymaps = [
    (mkKeymap "n" "<leader>xt" "<cmd>Trouble todo toggle<cr>" "Todo (Trouble)")
    (mkKeymap "n" "<leader>xT"
      "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>"
      "Todo/Fix/Fixme (Trouble)")

    (mkKeymap "n" "<leader>xX"
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>"
      "Buffer Diagnostics (Trouble)")
    (mkKeymap "n" "<leader>xx" "<cmd>Trouble diagnostics toggle <cr>"
      "iagnostics (Trouble)")
    (mkKeymap "n" "<leader>xL" "<cmd>Trouble loclist toggle<cr>"
      "Location List (Trouble)")
    (mkKeymap "n" "<leader>xQ" "<cmd>Trouble qflist toggle<cr>"
      "QuickFix List (Trouble)")
    (mkKeymap "n" "<leader>xl"
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>"
      "LSP Definitions / references / ... (Trouble)")
    (mkKeymap "n" "<leader>xs" "<cmd>Trouble symbols toggle focus=false<cr>"
      "Symbols (Trouble)")

    (mkKeymap "n" "<leader>st" "<cmd>TodoTelescope<cr>" "Todo")
    (mkKeymap "n" "<leader>sT" "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>"
      "Todo/Fix/Fixme")

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

    (mkKeymap "n" "<leader>,"
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>"
      "Switch Buffer")
    (mkKeymap "n" "<leader>:" "<cmd>Telescope command_history<cr>"
      "Command History")

    # find
    (mkKeymap "n" "<leader>fb"
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>" "Buffers")
    (mkKeymap "n" "<leader>ff" "<cmd>Telescope find_files<cr>"
      "Find Files (Root Dir)")

    (mkKeymap "n" "<leader>f/" "<cmd>Telescope live_grep<cr>" "Grep (cwd)")

    (mkKeymap "n" "<leader>fr" "<cmd>Telescope oldfiles<cr>" "Recent")

    (mkKeymap "n" "<leader>fg" "<cmd>Telescope git_files<CR>"
      "Find Files (git-files)")

    (mkKeymap "n" "<leader>fr" "<cmd>Telescope oldfiles<CR>" "Recent")

    # git
    (mkKeymap "n" "<leader>gc" "<cmd>Telescope git_commits<CR>" "Commits")
    (mkKeymap "n" "<leader>gs" "<cmd>Telescope git_status<CR>" "Status")

    # search
    (mkKeymap "n" "<leader>s'" "<cmd>Telescope registers<cr>" "Registers")
    (mkKeymap "n" "<leader>sa" "<cmd>Telescope autocommands<cr>"
      "Auto Commands")
    (mkKeymap "n" "<leader>sb" "<cmd>Telescope current_buffer_fuzzy_find<cr>"
      "Buffer")
    (mkKeymap "n" "<leader>sc" "<cmd>Telescope command_history<cr>"
      "Command History")
    (mkKeymap "n" "<leader>sC" "<cmd>Telescope commands<cr>" "Commands")
    (mkKeymap "n" "<leader>sd" "<cmd>Telescope diagnostics bufnr=0<cr>"
      "Document Diagnostics")
    (mkKeymap "n" "<leader>sD" "<cmd>Telescope diagnostics<cr>"
      "Workspace Diagnostics")
    (mkKeymap "n" "<leader>sh" "<cmd>Telescope help_tags<cr>" "Help Pages")
    (mkKeymap "n" "<leader>sH" "<cmd>Telescope highlights<cr>"
      "Search Highlight Groups")
    (mkKeymap "n" "<leader>sj" "<cmd>Telescope jumplist<cr>" "Jumplist")
    (mkKeymap "n" "<leader>sk" "<cmd>Telescope keymaps<cr>" "Key Maps")
    (mkKeymap "n" "<leader>sl" "<cmd>Telescope loclist<cr>" "Location List")
    (mkKeymap "n" "<leader>sM" "<cmd>Telescope man_pages<cr>" "Man Pages")
    (mkKeymap "n" "<leader>sm" "<cmd>Telescope marks<cr>" "Jump to Mark")
    (mkKeymap "n" "<leader>so" "<cmd>Telescope vim_options<cr>" "Options")
    (mkKeymap "n" "<leader>sr" "<cmd>Telescope resume<cr>" "Resume")
    (mkKeymap "n" "<leader>su" "<cmd>Telescope undo<cr>" "Undo")
    (mkKeymap "n" "<leader>sq" "<cmd>Telescope quickfix<cr>" "Quickfix List")
    (mkKeymap "n" "<leader>uC" "<cmd>Telescope colorscheme<cr>" "Colorschmes")
  ];
}
