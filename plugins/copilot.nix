{ lib, config, ... }:
let
  inherit (config.nvix.mkKey) mkKeymap wKeyObj;
  inherit (lib.nixvim) mkRaw;
in
{
  plugins = {
    copilot-lua = {
      enable = true;
      settings = {
        filetypes.markdown = true;
        suggestion = {
          enabled = true;
          auto_trigger = true;
        };
      };
    };
    copilot-chat = {
      enable = true;
      settings = {
        window = {
          border = "rounded";
          layout = "float";
          width = 0.5;
          height = 0.6;
        };
      };
    };
  };
  wKeyList = [ (wKeyObj [ "<leader>a" "󰚩" "ai" ]) ];
  keymaps = [
    (mkKeymap "n" "<leader>ac"
      (mkRaw # lua
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
