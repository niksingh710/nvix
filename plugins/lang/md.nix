{ pkgs, config, lib, ... }:
let
  inherit (config.nvix.mkKey) wKeyObj;
  inherit (lib.nixvim) mkRaw;
in
{
  plugins = {
    markdown-preview.enable = true;
    glow = {
      enable = true;
      lazyLoad.settings = {
        ft = "markdown";
        cmd = "Glow";
      };
    };
  };

  # TODO: Add mkdnflow

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
