{
  plugins.noice = {
    enable = true;
    settings = {
      presets.bottom_search = true;
      views = {
        cmdline_popup = {
          position = {
            row = -2;
            col = "50%";
          };
        };
        cmdline_popupmenu.position = {
          row = -5;
          col = "50%";
        };
      };

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
