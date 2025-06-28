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
      session_lens.previewer = true;
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>q." "<cmd>SessionRestore<CR>" "Last Session")
    (mkKeymap "n" "<leader>ql" "<cmd>Autosession search<CR>" "List Session")
    (mkKeymap "n" "<leader>qd" "<cmd>Autosession delete<CR>" "Delete Session")
    (mkKeymap "n" "<leader>qs" "<cmd>SessionSave<CR>" "Save Session")
    (mkKeymap "n" "<leader>qD" "<cmd>SessionPurgeOrphaned<CR>" "Purge Orphaned Sessions")
  ];
}
