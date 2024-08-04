{ mkKey, ... }:
let inherit (mkKey) mkKeymap;
in {
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      undo.enable = true;
    };
    settings = {
      pickers = { colorscheme.enable_preview = true; };
      defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "%.ipynb"
          "^secrets/"
        ];
        mappings = {
          n = {
            q = { __raw = "require('telescope.actions').close"; };
            s = { __raw = "require('telescope.actions').select_horizontal"; };
            v = { __raw = "require('telescope.actions').select_vertical"; };
          };
        };
      };
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>go" "<cmd>Telescope git_status<cr>"
      "Open changed file")
    (mkKeymap "n" "<leader>gb" "<cmd>Telescope git_branches<cr>"
      "Checkout branch")
    (mkKeymap "n" "<leader>gc" "<cmd>Telescope git_commits<cr>"
      "Checkout commit")

    (mkKeymap "n" "<leader>sd" "<cmd>Telescope diagnostics theme=ivy<cr>"
      "Search Diagnostics")
    (mkKeymap "n" "<leader>sn" "<cmd>Telescope notify<cr>"
      "Notifications Search")
    (mkKeymap "n" "<leader>sf" "<cmd>Telescope find_files<cr>"
      "Search Find files")
    (mkKeymap "n" "<leader>sF" "<cmd>Telescope find_files hidden=true<cr>"
      "Find files Hidden Also")
    (mkKeymap "n" "<leader>sr" "<cmd>Telescope oldfiles<cr>"
      "Search Recent files")
    (mkKeymap "n" "<leader>sk" "<cmd>Telescope keymaps theme=dropdown<cr>"
      "Search Keymaps")
    (mkKeymap "n" "<leader>ss" "<cmd>Telescope builtin<cr>" "Search Telescope")
    (mkKeymap "n" "<leader>sg" "<cmd>Telescope live_grep<cr>"
      "Search Live Grep")
    (mkKeymap "n" "<leader>sH" "<cmd>Telescope help_tags<cr>"
      "Search Help Tags")
    (mkKeymap "n" "<leader>sb" "<cmd>Telescope buffers<cr>" "Search Buffers")
    (mkKeymap "n" "<leader>sc" "<cmd>Telescope commands<cr>" "Search Commands")
    (mkKeymap "n" "<leader>sm" "<cmd>Telescope marks<cr>"
      "Search in Media Mode")
    (mkKeymap "n" "<leader>so" "<cmd>Telescope vim_options<cr>"
      "Search Vim Options")
    (mkKeymap "n" "<leader>sq" "<cmd>Telescope quickfix<cr>" "Search Quickfix")
    (mkKeymap "n" "<leader>sl" "<cmd>Telescope loclist<cr>"
      "Search Location List")
    (mkKeymap "n" "<leader>sp" "<cmd>Telescope projects<cr>" "Search Projects")
    (mkKeymap "n" "<leader>sP" "<cmd>Telescope colorscheme<cr>"
      "Search ColorScheme with previews")
    (mkKeymap "n" "<leader>su" "<cmd>Telescope undo<cr>" "Search undo")
    (mkKeymap "n" "<leader>s/" "<cmd>Telescope current_buffer_fuzzy_find<cr>"
      "Fuzzy Buffer Search")

  ];
}
