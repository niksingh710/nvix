{
  pkgs,
  config,
  lib,
  ...
}:
let
  inherit (config.nvix.mkKey) wKeyObj;
  inherit (config.nvix) icons;
  inherit (lib.nixvim) mkRaw;
in
{
  plugins = {
    img-clip.enable = true;
    markdown-preview = {
      enable = true;
      settings.echo_preview_url = 1;
    };
    render-markdown.enable = true;
    mkdnflow = {
      enable = true;
      settings = {
        toDo.symbols = [
          " "
          "⧖"
          "x"
        ];
        mappings = {
          MkdnEnter = {
            key = "<cr>";
            modes = [
              "n"
              "i"
            ];
          };
          MkdnToggleToDo = {
            key = "<c-space>";
            modes = [
              "n"
              "i"
            ];
          };
        };
      };
    };
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
        # lua
        mkRaw ''
          function()
            -- Set keymap: <leader>p to save and convert to PDF using pandoc
            vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pg', '<cmd>Glow<CR>', { desc = "Markdown Glow preview", noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pb', '<cmd>MarkdownPreview<CR>', { desc = "Markdown Browser Preview", noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pp', '<cmd> lua require("md-pdf").convert_md_to_pdf()<CR>', { desc = "Markdown Print pdf", noremap = true, silent = true })
          end
        '';
    }
  ];

  wKeyList = [
    (wKeyObj [
      "<leader>p"
      ""
      "preview"
    ])
  ];
}
