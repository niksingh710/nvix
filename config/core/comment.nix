{ mkKey, helpers, ... }:
let inherit (mkKey) mkKeymap;
in {
  plugins.comment.enable = true;
  keymaps = [
    (mkKeymap "n" "<leader>/"
      (helpers.mkRaw
        ''function() require("Comment.api").toggle.linewise.current() end'')
      "Toggle comment")
    (mkKeymap "v" "<leader>/"
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"
      "Toggle comment")
  ];
}
