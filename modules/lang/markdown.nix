{
  inputs,
  pkgs,
  config,
  helpers,
  ...
}:
let
  inherit (config.nvix.mkKey) wKeyObj;
in
{
  plugins = {
    render-markdown = {
      enable = true;
      lazyLoad.settings.ft = "markdown";
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

  # TODO: Add mkdnflow

  autoCmd = [
    {
      desc = "Setup Markdown mappings";
      event = "Filetype";
      pattern = "markdown";
      callback =
        helpers.mkRaw # lua
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
    (wKeyObj [
      "<leader>p"
      ""
      "preview"
    ])
  ];

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "md-pdf";
      src = inputs.md-pdf;
    })
  ];
  extraPackages = with pkgs; [ pandoc ];
  extraConfigLua = # lua
    ''
      require("md-pdf").setup({ toc = false })
    '';
}
