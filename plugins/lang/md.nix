{ pkgs, config, lib, ... }:
let
  inherit (config.nvix.mkKey) wKeyObj;
  inherit (config.nvix) icons;
  inherit (lib.nixvim) mkRaw;
in
{

  highlight = {
    ObsidianMinus.fg = "#5fafff";
    ObsidianCaret.fg = "#ff5f5f";
  };
  plugins = {
    render-markdown = {
      enable = true;
      settings = {
        preset = "obsidian";
        checkbox = {
          checked.icon = "${icons.ui.lazy.loaded} ";
          unchecked.icon = "${icons.ui.lazy.not_loaded} ";
          custom = {
            todoPending = { raw = "[-]"; rendered = "󰥔 "; highlight = "ObsidianMinus"; };
            todoCaret = { raw = "[^]"; rendered = "^ "; highlight = "ObsidianCaret"; };
          };
        };
      };
    };
    obsidian = {
      enable = true;
      settings = {
        ui = {
          enable = false;
          checkboxes = {
            " " = {
              char = "${icons.ui.lazy.not_loaded}";
              hl_group = "ObsidianTilde";
            };
            x = {
              char = "${icons.ui.lazy.loaded}";
              hl_group = "ObsidianDone";
            };
            "-" = {
              char = "󰥔";
              hl_group = "ObsidianMinus";
            };
            "^" = {
              char = "^";
              hl_group = "ObsidianCaret";
            };
          };
        };
        dir = "~/notes";
      };
    };
    markdown-preview.enable = true;
    glow = {
      enable = true;
      lazyLoad.settings = {
        ft = "markdown";
        cmd = "Glow";
      };
    };
  };

  autoCmd = [
    {
      desc = "Setup Markdown mappings";
      event = "Filetype";
      pattern = "markdown";
      callback =
        mkRaw # lua
          ''
            function()
              -- Set keymap: <leader>p to save and convert to PDF using pandoc
              vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pg', '<cmd>Glow<CR>', { desc = "Markdown Glow preview", noremap = true, silent = true })
              vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pb', '<cmd>MarkdownPreview<CR>', { desc = "Markdown Browser Preview", noremap = true, silent = true })
              vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pp', '<cmd> lua require("md-pdf").convert_md_to_pdf()<CR>', { desc = "Markdown Print pdf", noremap = true, silent = true })
              vim.api.nvim_buf_set_keymap(0, 'n', '<leader><cr>', ':ObsidianToggleCheckbox<CR>', { desc = "obsidian smart action", noremap = true, silent = true })
            end
          '';
    }
  ];

  wKeyList = [
    (wKeyObj [ "<leader>p" "" "preview" ])
  ];
  extraPlugins = with pkgs.vimPlugins; [ img-clip-nvim ];
  extraPackages =
    with pkgs;
    if pkgs.stdenv.isDarwin then
      [ pngpaste ]
    else
      [ wl-clipboard ];
}
