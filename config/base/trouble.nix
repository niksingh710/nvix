{ mkKey, specObj, ... }:
let inherit (mkKey) mkKeymap;
in {
  plugins.trouble.enable = true;
  wKeyList = [ (specObj [ "<leader>x" "" "diagnostics/quickfix" ]) ];

  keymaps = [
    (mkKeymap "n" "<leader>xt" "<cmd>Trouble todo toggle<cr>" "Todo (Trouble)")
    (mkKeymap "n" "<leader>xT"
      "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>"
      "Todo/Fix/Fixme (Trouble)")

    (mkKeymap "n" "<leader>xX"
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>"
      "Buffer Diagnostics (Trouble)")
    (mkKeymap "n" "<leader>xx" "<cmd>Trouble diagnostics toggle <cr>"
      "iagnostics (Trouble)")
    (mkKeymap "n" "<leader>xL" "<cmd>Trouble loclist toggle<cr>"
      "Location List (Trouble)")
    (mkKeymap "n" "<leader>xQ" "<cmd>Trouble qflist toggle<cr>"
      "QuickFix List (Trouble)")
    (mkKeymap "n" "<leader>xl"
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>"
      "LSP Definitions / references / ... (Trouble)")
    (mkKeymap "n" "<leader>xs" "<cmd>Trouble symbols toggle focus=false<cr>"
      "Symbols (Trouble)")
  ];

}
