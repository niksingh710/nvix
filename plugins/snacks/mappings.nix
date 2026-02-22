{ config, ... }:
let
  inherit (config.nvix.mkKey) mkKeymap wKeyObj;
in
{
  wKeyList = [
    (wKeyObj [
      "<leader>."
      ""
      "Scratch Buffer"
    ])
    (wKeyObj [
      "<leader>:"
      ""
      ""
      true
    ])
    (wKeyObj [
      "<leader>s"
      ""
      "search"
    ])
    (wKeyObj [
      "<leader>f"
      ""
      "file/find"
    ])
    (wKeyObj [
      "<leader>e"
      "󰙅"
      "Explorer"
    ])
  ];

  keymaps = [
    (mkKeymap "n" "<leader>e" "<cmd>:lua Snacks.explorer()<cr>" "Explorer")
    (mkKeymap "n" "<leader>.." "<cmd>:lua Snacks.scratch()<cr>" "Toggle Scratch Buffer")
    (mkKeymap "n" "<leader>.s" "<cmd>:lua Snacks.scratch.select()<cr>" "Select Scratch Buffer")
    (mkKeymap "n" "<leader>sn" "<cmd>:lua Snacks.notifier.show_history()<cr>" "Notification History")
    (mkKeymap "n" "<leader>.r" "<cmd>:lua Snacks.rename.rename_file()<cr>" "Rename file/variable +lsp")
    (mkKeymap "n" "<leader>un" "<cmd>:lua Snacks.notifier.hide()<cr>" "Dismiss All Notifications")
  ];
}
