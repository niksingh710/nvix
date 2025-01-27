{ pkgs, ... }:
{
  extraPlugins = [
    pkgs.vimPlugins.windows-nvim
  ];

  extraConfigLua = # lua
    ''
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
    '';

  plugins = {
    dressing = {
      enable = true;
      settings.input.mappings.n = {
        "q" = "Close";
        "k" = "HistoryPrev";
        "j" = "HistoryNext";
      };
    };
    lastplace.enable = true;
    fidget = {
      enable = true;
      settings = {
        progress.display.progressIcon.pattern = "moon";
        notification.window = {
          relative = "editor";
          winblend = 0;
          border = "none";
        };
      };
    };
    noice = {
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
  };
}
