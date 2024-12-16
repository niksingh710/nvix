{
  plugins.noice = {
    enable = true;
    settings = {
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
}
