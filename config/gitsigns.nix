{ icons, mkKey, ... }:
let inherit (mkKey) mkKeymap;

in {
  plugins.gitsigns = {
    enable = true;
    settings = {
      current_line_blame = true;
      signs = {
        add = {
          text = "${icons.ui.LineLeft}";
        };
        change = {
          text = "${icons.ui.LineLeft}";
        };
        delete = {
          text = "${icons.ui.LineLeft}";
        };
        topdelete = {
          text = "${icons.ui.Triangle}";
        };
        changedelete = {
          text = "${icons.ui.BoldLineLeft}";
        };
      };
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader>gj" "<cmd>lua require 'gitsigns'.next_hunk()<cr>"
      "Next Hunk")
    (mkKeymap "n" "<leader>gk" "<cmd>lua require 'gitsigns'.prev_hunk()<cr>"
      "Prev Hunk")
    (mkKeymap "n" "<leader>gl" "<cmd>lua require 'gitsigns'.blame_line()<cr>"
      "Blame")
    (mkKeymap "n" "<leader>gp" "<cmd>lua require 'gitsigns'.preview_hunk()<cr>"
      "Preview Hunk")
    (mkKeymap "n" "<leader>gr" "<cmd>lua require 'gitsigns'.reset_hunk()<cr>"
      "Reset Hunk")
    (mkKeymap "n" "<leader>gR" "<cmd>lua require 'gitsigns'.reset_buffer()<cr>"
      "Reset Buffer")
    (mkKeymap "n" "<leader>gs" "<cmd>lua require 'gitsigns'.stage_hunk()<cr>"
      "Stage Hunk")
    (mkKeymap "n" "<leader>gu"
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>" "Undo Stage Hunk")
    (mkKeymap "n" "<leader>gd" "<cmd>Gitsigns diffthis HEAD<cr>" "Diff")

    (mkKeymap "v" "<leader>gs"
      "<cmd>lua require 'gitsigns'.stage_hunk({vim.fn.line('.'),vim.fn.line('v')})<cr>"
      "Stage Hunk")
    (mkKeymap "v" "<leader>gu"
      "<cmd>lua require 'gitsigns'.undo_stage_hunk({vim.fn.line('.'),vim.fn.line('v')})<cr>"
      "undo Hunk")

    (mkKeymap "v" "<leader>gr"
      "<cmd>lua require 'gitsigns'.reset_hunk({vim.fn.line('.'),vim.fn.line('v')})<cr>"
      "Reset Hunk")

  ];
}
