{ config, ... }:
let inherit (config.nvix.mkKey) mkKeymap wKeyObj;
in
{
  wKeyList = [
    (wKeyObj [ "<leader>." "" "Scratch Buffer" ])
  ];
  keymaps = [
    (mkKeymap "n" "<leader>.." "<cmd>:lua Snacks.scratch()<cr>" "Toggle Scratch Buffer")
    (mkKeymap "n" "<leader>.s" "<cmd>:lua Snacks.scratch.select()<cr>" "Select Scratch Buffer")
    (mkKeymap "n" "<leader>sn" "<cmd>:lua Snacks.notifier.show_history()<cr>" "Notification History")
    (mkKeymap "n" "<leader>.r" "<cmd>:lua Snacks.rename.rename_file()<cr>" "Rename file/variable +lsp")
    (mkKeymap "n" "<leader>gB" "<cmd>:lua Snacks.gitbrowse()<cr>" "Git Browse")
    (mkKeymap "n" "<leader>gf" "<cmd>:lua Snacks.lazygit.log_file()<cr>" "Lazygit Current File History")
    (mkKeymap "n" "<leader>gB" "<cmd>:lua Snacks.gitbrowse()<cr>" "Git Browse")
    (mkKeymap "n" "<leader>gf" "<cmd>:lua Snacks.lazygit.log_file()<cr>" "Lazygit Current File History")
    (mkKeymap "n" "<leader>gg" "<cmd>:lua Snacks.lazygit()<cr>" "Lazygit")
    (mkKeymap "n" "<leader>gl" "<cmd>:lua Snacks.lazygit.log()<cr>" "Lazygit Log (cwd)")
    (mkKeymap "n" "<leader>un" "<cmd>:lua Snacks.notifier.hide()<cr>" "Dismiss All Notifications")
  ];
}
