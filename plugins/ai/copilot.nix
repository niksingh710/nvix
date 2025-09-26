{ lib, config, ... }:
let
  inherit (config.nvix.mkKey) mkKeymap wKeyObj;
  inherit (lib.nixvim) mkRaw;
in
{
  plugins = {
    chatgpt = {
      enable = true;
      settings = {
        keymaps = {
          submit = "<C-Enter>";
          close = "<Esc>";
        };
      };
    };
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
  };
  wKeyList = [
    (wKeyObj [
      "<leader>a"
      "󰚩"
      "ai"
    ])
  ];
  keymaps = [
    (mkKeymap "n" "<leader>ac" (
      # lua
      mkRaw ''
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

    (mkKeymap "n" "<leader>aCc" "<cmd>ChatGPT<CR>" "ChatGPT")
    (mkKeymap [ "n" "v" ] "<leader>aCe" "<cmd>ChatGPTEditWithInstruction<CR>" "Edit with instruction")
    (mkKeymap [ "n" "v" ] "<leader>aCg" "<cmd>ChatGPTRun grammar_correction<CR>" "Grammar Correction")
    (mkKeymap [ "n" "v" ] "<leader>aCt" "<cmd>ChatGPTRun translate<CR>" "Translate")
    (mkKeymap [ "n" "v" ] "<leader>aCk" "<cmd>ChatGPTRun keywords<CR>" "Keywords")
    (mkKeymap [ "n" "v" ] "<leader>aCd" "<cmd>ChatGPTRun docstring<CR>" "Docstring")
    (mkKeymap [ "n" "v" ] "<leader>aCa" "<cmd>ChatGPTRun add_tests<CR>" "Add Tests")
    (mkKeymap [ "n" "v" ] "<leader>aCo" "<cmd>ChatGPTRun optimize_code<CR>" "Optimize Code")
    (mkKeymap [ "n" "v" ] "<leader>aCs" "<cmd>ChatGPTRun summarize<CR>" "Summarize")
    (mkKeymap [ "n" "v" ] "<leader>aCf" "<cmd>ChatGPTRun fix_bugs<CR>" "Fix Bugs")
    (mkKeymap [ "n" "v" ] "<leader>aCx" "<cmd>ChatGPTRun explain_code<CR>" "Explain Code")
    (mkKeymap [ "n" "v" ] "<leader>aCr" "<cmd>ChatGPTRun roxygen_edit<CR>" "Roxygen Edit")
    (mkKeymap [
      "n"
      "v"
    ] "<leader>aCl" "<cmd>ChatGPTRun code_readability_analysis<CR>" "Code Readability Analysis")
  ];
}
