{ pkgs, config, ... }:
{
  extraPlugins = [
    pkgs.vimPlugins.windows-nvim
    pkgs.vimPlugins.nvzone-minty
  ];
  extraConfigLua = # lua
    ''
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup({
        ignore = {
          filetype = { "snacks_picker_list", "snacks_layout_box" },
        },
      })

      require('minty').setup({
        huefy = {
          border = "${config.nvix.border}",
          mappings = function(buf)
            local api = require("minty.shades.api")
            vim.keymap.set("n", "s", api.save_color, { buffer = buf })
          end
        }
      })
    '';

  plugins = {
    colorizer = {
      enable = true;
      settings = {
        filetypes = {
          __unkeyed = "*";
        };
        user_default_options = {
          names = true;
          RRGGBBAA = true;
          AARRGGBB = true;
          rgb_fn = true;
          hsl_fn = true;
          css = true;
          css_fn = true;
          tailwind = true;
          mode = "virtualtext";
          virtualtext = "■";
          always_update = true;
        };
      };
    };
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
        progress.display.progress_icon = [ "moon" ];
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
