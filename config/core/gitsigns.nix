{ mkKey, icons, specObj, ... }:
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

    (mkKeymap "n" "<leader>ghS" "lua require 'gitsigns'.stage_buffer"
      "Stage Buffer")
    (mkKeymap "n" "<leader>ghu" "lua require 'gitsigns'.undo_stage_hunk"
      "Undo Stage Hunk")
    (mkKeymap "n" "<leader>ghR" "lua require 'gitsigns'.reset_buffer"
      "Reset Buffer")
    (mkKeymap "n" "<leader>ghp" "lua require 'gitsigns'.preview_hunk_inline"
      "Preview Hunk Inline")
    (mkKeymap "n" "<leader>ghb"
      "function() lua require 'gitsigns'.blame_line({ full = true }) end"
      "Blame Line")
    (mkKeymap "n" "<leader>ghB" "function() lua require 'gitsigns'.blame() end"
      "Blame Buffer")
    (mkKeymap "n" "<leader>ghd" "lua require 'gitsigns'.diffthis" "Diff This")
    (mkKeymap "n" "<leader>ghD"
      "function() lua require 'gitsigns'.diffthis('~') end" "Diff This ~")

    (mkKeymap "n" "]H" {
      __raw = # lua
        ''
          function()
            require 'gitsigns'.nav_hunk("last")
          end
        '';
    } "Last Hunk")
    (mkKeymap "n" "[H" {
      __raw = # lua
        ''
          function()
            require 'gitsigns'.nav_hunk("first") 
          end
        '';
    } "First Hunk")

    (mkKeymap "n" "<leader>ghs" ":Gitsigns stage_hunk<CR>" "Stage Hunk")
    (mkKeymap "v" "<leader>ghs" ":Gitsigns stage_hunk<CR>" "Stage Hunk")
    (mkKeymap "n" "<leader>ghr" ":Gitsigns reset_hunk<CR>" "Reset Hunk")
    (mkKeymap "v" "<leader>ghr" ":Gitsigns reset_hunk<CR>" "Reset Hunk")

    (mkKeymap "o" "ih" ":<C-U>Gitsigns select_hunk<CR>" "GitSigns Select Hunk")
    (mkKeymap "x" "ih" ":<C-U>Gitsigns select_hunk<CR>" "GitSigns Select Hunk")

  ];
}
