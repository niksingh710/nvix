{ config, ... }:
let
  inherit (config.nvix.mkKey) mkKeymap;
in
{
  plugins.auto-session = {
    enable = true;
    autoLoad = true;
    settings = {
      use_git_branch = true;
      session_lens = {
        picker_opts.preview = true;
        mappings = {
          delete_session = [
            "n"
            "d"
          ];
        };
      };
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>q." "<cmd>AutoSession restore<CR>" "Last Session")
    (mkKeymap "n" "<leader>ql" "<cmd>AutoSession search<CR>" "List Session")
    (mkKeymap "n" "<leader>qd" "<cmd>AutoSession deletePicker<CR>" "Delete Session")
    (mkKeymap "n" "<leader>qs" "<cmd>AutoSession save<CR>" "Save Session")
    (mkKeymap "n" "<leader>qD" "<cmd>AutoSession purgeOrphaned<CR>" "Purge Orphaned Sessions")
  ];
}
