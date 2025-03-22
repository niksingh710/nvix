{ config, helpers, ... }:
let inherit (config.nvix.mkKey) mkKeymap wKeyObj;
in
{
  wKeyList = [
    (wKeyObj [ "<leader>s," "" "Scratch Buffer" ])
    (wKeyObj [ "<leader>:" "" "" true ])
    (wKeyObj [ "<leader>s" "" "search" ])
    (wKeyObj [ "<leader>f" "" "file/find" ])
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
    (mkKeymap "n" "<leader>gL" "<cmd>:lua Snacks.picker.git_log()<cr>" "Git Log (cwd)")
    (mkKeymap "n" "<leader>un" "<cmd>:lua Snacks.notifier.hide()<cr>" "Dismiss All Notifications")


    # Telescope replacement
    (mkKeymap "n" "<leader>sP" "<cmd>:lua Snacks.picker()<cr>" "Pickers")
    (mkKeymap "n" "<leader>ss" "<cmd>:lua Snacks.picker.smart()<cr>" "Smart")
    (mkKeymap "n" "<leader>st" "<cmd>:lua Snacks.picker.todo_comments({layout = 'ivy'})<cr>" "Todo")
    (mkKeymap "n" "<leader>sT" ''<cmd>:lua Snacks.picker.todo_comments({keywords = {"TODO", "FIX", "FIXME"}, layout = 'ivy'})<cr>'' "Todo")
    (mkKeymap "n" "<leader>s:" ''<cmd>:lua Snacks.picker.command_history({ layout = 'ivy'})<cr>'' "Command History")
    (mkKeymap "n" "<leader>s," "<cmd>:lua Snacks.picker.buffers({layout = 'vscode'})<cr>" "Buffers")
    (mkKeymap "n" "<leader>sh" ''<cmd>:lua Snacks.picker.help()<cr>'' "Help Pages")
    (mkKeymap "n" "<leader>sk" ''<cmd>:lua Snacks.picker.keymaps()<cr>'' "Keymaps")

    (mkKeymap "n" "<leader>su"
      (helpers.mkRaw # lua
        ''
          function()
            Snacks.picker.undo({
              win = {
                input = {
                  keys = {
                    ["y"] = { "yank_add", mode =  "n" },
                    ["Y"] = { "yank_del", mode =  "n" },
                  },
                },
              },
            })
          end
        '')
      "Undo")

    (mkKeymap "n" "<leader>ff" "<cmd>:lua Snacks.picker.files()<cr>" "Find Files")
    (mkKeymap "n" "<leader>fF" "<cmd>:lua Snacks.picker.smart()<cr>" "Smart")
    (mkKeymap "n" "<leader>f/" "<cmd>:lua Snacks.picker.grep()<cr>" "Grep")
    (mkKeymap "n" "<leader>fr" "<cmd>:lua Snacks.picker.recent()<cr>" "Recent")
    (mkKeymap "n" "<leader>fp" "<cmd>:lua Snacks.picker.projects()<cr>" "Pickers")
  ];

}
