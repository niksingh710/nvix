{ mkKey, helpers, ... }:
let inherit (mkKey) mkKeymap;
in {
  plugins = {
    notify = {
      enable = true;
      backgroundColour = "#000000";
      render = "minimal";
      stages = "fade_in_slide_out";
    };
    noice = {
      enable = true;
      lsp = {
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
        hover.enabled = false;
        message.enabled = false;
        signature.enabled = false;
        progress.enabled = false;
      };
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>un"
      (helpers.mkRaw "function () require('notify').dismiss() end")
      "Dismiss notification")
  ];
}
