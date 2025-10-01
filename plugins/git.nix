{ config, lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
  inherit (config.nvix) icons;
  inherit (config.nvix.mkKey) mkKeymap wKeyObj;
in
{
  plugins = {
    git-conflict = {
      enable = true;
      settings.default_mappings = true;
    };
    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        preview_config = {
          border = "rounded";
        };
        signs = with icons.ui; {
          add.text = "${LineLeft}";
          change.text = "${LineLeft}";
          delete.text = "${LineLeft}";
          topdelete.text = "${Triangle}";
          changedelete.text = "${BoldLineLeft}";
        };
      };
    };
  };
  wKeyList = [
    (wKeyObj [
      "<leader>g"
      ""
      "git"
    ])
    (wKeyObj [
      "<leader>gh"
      "󰫅"
      "hunks"
    ])
    (wKeyObj [
      "<leader>gb"
      "󰭐"
      "blame"
    ])
  ];

  keymaps = [

    # Navigation
    (mkKeymap "n" "]h" (
      # lua
      mkRaw ''
        function ()
          if vim.wo.diff then
            vim.cmd.normal ({ ' ]c', bang = true})
        else
            require('gitsigns').nav_hunk('next')
          end
        end
      ''
    ) "Next Hunk")

    (mkKeymap "n" "[h" (
      # lua
      mkRaw ''
        function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            require('gitsigns').nav_hunk('prev')
          end
        end
      ''
    ) "Prev Hunk")

    (mkKeymap "n" "]H" (mkRaw "function() require('gitsigns').nav_hunk('last') end") "Last Hunk")

    (mkKeymap "n" "[H" (mkRaw "function() require('gitsigns').nav_hunk('first') end") "First Hunk")

    # Stage / Reset
    (mkKeymap "n" "<leader>gs" "<cmd>lua require('gitsigns').stage_buffer()<CR>" "Stage Buffer")
    (mkKeymap "v" "<leader>gs" (
      # lua
      mkRaw ''
        function()
        require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end
      ''
    ) "Stage/Unstage Selection")

    (mkKeymap "n" "<leader>gr" "<cmd>lua require('gitsigns').reset_buffer()<CR>" "Reset Buffer")
    (mkKeymap "v" "<leader>gr" (
      # lua
      mkRaw ''
        function()
        require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end
      ''
    ) "Reset Selection")

    # Undo
    (mkKeymap "n" "<leader>gu" "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>" "Undo Stage Hunk")

    # Preview / Diff
    (mkKeymap "n" "<leader>gp" "<cmd>lua require('gitsigns').preview_hunk_inline()<CR>"
      "Preview Hunk Inline"
    )
    (mkKeymap "n" "<leader>gP" "<cmd>lua require('gitsigns').preview_hunk()<CR>" "Preview Hunk (Popup)")
    (mkKeymap "v" "<leader>gp" (
      # lua
      mkRaw ''
        function()
        require('gitsigns').preview_hunk_inline({ vim.fn.line('.'), vim.fn.line('v') })
        end
      ''
    ) "Preview Selection")

    (mkKeymap "n" "<leader>dg" "<cmd>lua require('gitsigns').diffthis()<CR>" "Git Diff ")
    (mkKeymap "n" "<leader>dG" (mkRaw "function() require('gitsigns').diffthis('~') end")
      "Git diff last commit (HEAD~)"
    )

    # Blame
    (mkKeymap "n" "<leader>gk" (mkRaw "function() require('gitsigns').blame_line({ full = true }) end")
      "Blame Line (Full)"
    )
    (mkKeymap "n" "<leader>gK" ":lua require('gitsigns').blame()<CR>" "Blame File")

    # Quickfix
    (mkKeymap "n" "<leader>gq" ":lua require('gitsigns').setqflist()<CR>" "Hunks to Quickfix")
    (mkKeymap "n" "<leader>gQ" (mkRaw "function() require('gitsigns').setqflist('all') end")
      "All Hunks to Quickfix"
    )

    # Toggles
    (mkKeymap "n" "<leader>gb" "<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>"
      "Toggle Blame (Line)"
    )
    (mkKeymap "n" "<leader>gw" "<cmd>lua require('gitsigns').toggle_word_diff()<CR>" "Toggle Word Diff")

    # Text object
    (mkKeymap "o" "ih" ":<C-U>Gitsigns select_hunk<CR>" "Select Hunk")
    (mkKeymap "x" "ih" ":<C-U>Gitsigns select_hunk<CR>" "Select Hunk")

  ];
}
