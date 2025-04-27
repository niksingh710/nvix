{ helpers, config, ... }:
let
  inherit (config.nvix.mkKey) mkKeymap wKeyObj;
in
{
  wKeyList = [
    (wKeyObj [
      "<leader>a"
      "󰚩"
      "ai"
    ])
  ];
  keymaps = [
    (mkKeymap "n" "<leader>ac" (helpers.mkRaw # lua
      ''
        function()
          if vim.g.copilot_status == nil then
            vim.g.copilot_status = "running"
          end
          if vim.g.copilot_status == "running" then
            vim.g.copilot_status = "stopped"
            vim.cmd("Copilot disable")
          else
            vim.g.copilot_status = "running"
            vim.cmd("Copilot enable")
          end
        end
      ''
    ) "Toggle Copilot")
  ];
}
