{ mkKey, helpers, icons, specObj, ... }:
let inherit (mkKey) mkKeymap;
in {
  wKeyList = [
    (specObj [ "<leader>g" "" "git" ])
    (specObj [ "<leader>gh" "" "hunks" ])
  ];
  plugins.gitsigns = {
    enable = true;
    settings = {
      current_line_blame = true;
      signs = {
        add = { text = "${icons.ui.LineLeft}"; };
        change = { text = "${icons.ui.LineLeft}"; };
        delete = { text = "${icons.ui.LineLeft}"; };
        topdelete = { text = "${icons.ui.Triangle}"; };
        changedelete = { text = "${icons.ui.BoldLineLeft}"; };
      };
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>ghS" "<cmd>lua require('gitsigns').stage_buffer()<cr>"
      "Stage Buffer")
    (mkKeymap "n" "<leader>ghu" "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>"
      "Undo Stage Hunk")
    (mkKeymap "n" "<leader>ghR" "<cmd>lua require('gitsigns').reset_buffer()<cr>"
      "Reset Buffer")
    (mkKeymap "n" "<leader>ghp" "<cmd>lua require('gitsigns').preview_hunk_inline()<cr>"
      "Preview Hunk Inline")
    (mkKeymap "n" "<leader>ghb"
      "<cmd>lua require('gitsigns').blame_line({ full = true })<cr>"
      "Blame Line")
    (mkKeymap "n" "<leader>ghB" "<cmd>lua require('gitsigns').blame()<cr>"
      "Blame Buffer")
    (mkKeymap "n" "<leader>gl" "<cmd>lua require('gitsigns').blame_line()<cr>" "Blame")
    (mkKeymap "n" "<leader>ghd" "<cmd>lua require('gitsigns').diffthis()<cr>" "Diff This")
    (mkKeymap "n" "<leader>ghD"
      "<cmd>lua require('gitsigns').diffthis('~')<cmd>" "Diff This ~")
    (mkKeymap "n" "]H"
      (helpers.mkRaw # lua
        ''
          function()
            require 'gitsigns'.nav_hunk("last")
          end
        '') "Last Hunk")
    (mkKeymap "n" "[H"
      (helpers.mkRaw # lua
        ''
          function()
            require 'gitsigns'.nav_hunk("first") 
          end
        '')
      "First Hunk")

    (mkKeymap "n" "<leader>ghs" ":Gitsigns stage_hunk<CR>" "Stage Hunk")
    (mkKeymap "v" "<leader>ghs" ":Gitsigns stage_hunk<CR>" "Stage Hunk")
    (mkKeymap "n" "<leader>ghr" ":Gitsigns reset_hunk<CR>" "Reset Hunk")
    (mkKeymap "v" "<leader>ghr" ":Gitsigns reset_hunk<CR>" "Reset Hunk")

    (mkKeymap "o" "ih" ":<C-U>Gitsigns select_hunk<CR>" "GitSigns Select Hunk")
    (mkKeymap "x" "ih" ":<C-U>Gitsigns select_hunk<CR>" "GitSigns Select Hunk")

  ];
}
