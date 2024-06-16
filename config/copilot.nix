{mkKey, ...}:
let
  inherit (mkKey) mkKeymap;
in{
  plugins.copilot-lua = {
    enable = true;
    filetypes=  {
      markdown = true;
    };
    suggestion = {
      enabled = true;
      autoTrigger = true;
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>ucc" {
      __raw = #lua
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
      '';
     }
     "Toggle Copilot")
  ];
}
