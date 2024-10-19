{ mkKey, ... }:
let inherit (mkKey) mkKeymap;
in {
  plugins.auto-session = {
    enable = true;
    settings = {
      auto_save = true;
      auto_restore = false;
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>q." "<cmd>SessionRestore<CR>" "Last Session")
    (mkKeymap "n" "<leader>ql" "<cmd>Autosession search<CR>" "List Session")
    (mkKeymap "n" "<leader>qd" "<cmd>Autosession delete<CR>" "Delete Session")
    (mkKeymap "n" "<leader>qs" "<cmd>SessionSave<CR>" "Save Session")
    (mkKeymap "n" "<leader>qD" "<cmd>SessionPurgeOrphaned<CR>"
      "Purge Orphaned Sessions")
  ];
}
