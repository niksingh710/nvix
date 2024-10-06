{ mkPkgs, inputs, pkgs, specObj, helpers, ... }:
{
  plugins = {
    render-markdown.enable = true;
    markdown-preview.enable = true;
  };

  # TODO: Add mkdnflow

  autoCmd = [
    {
      desc = "Setup Markdown mappings";
      event = "Filetype";
      pattern = "markdown";
      callback = helpers.mkRaw # lua 
        '' 
          function()
            -- Set keymap: <leader>p to save and convert to PDF using pandoc
            vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pb', '<cmd>MarkdownPreview<CR>', { desc = "Markdown Browser Preview", noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pp', '<cmd> lua require("md-pdf").convert_md_to_pdf()<CR>', { desc = "Markdown Print pdf", noremap = true, silent = true })
          end
          '';
    }
    {
      desc = "Remove Markdown mappings";
      event = "BufUnload";
      pattern = "*.md";
      callback = helpers.mkRaw # lua 
        '' 
          function()
            -- Set keymap: <leader>p to save and convert to PDF using pandoc
            vim.api.nvim_buf_del_keymap(0, 'n', 'pb')
            vim.api.nvim_buf_del_keymap(0, 'n', 'pp')
          end
          '';
    }
  ];

  wKeyList = [
    (specObj [ "<leader>p" "" "preview" ])
  ];

  extraPlugins = [
    (mkPkgs "md-pdf" inputs.md-pdf)
  ];
  extraPackages = with pkgs; [ pandoc ];
  extraConfigLua = # lua
    ''
      require("md-pdf").setup({ toc = false })
    '';
}

