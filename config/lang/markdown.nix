{ pkgs, inputs, mkKey, ... }:
let inherit (mkKey) mkKeymap;
in {

  plugins.markdown-preview = { enable = true; };
  extraPlugins = [
    pkgs.vimPlugins.glow-nvim
    (pkgs.vimUtils.buildVimPlugin {
      name = "nvim-markdown";
      src = inputs.nvim-md;
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "nvim-hl-md";
      src = inputs.nvim-hl-md;
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "markview";
      src = inputs.markview;
    })
  ];
  keymaps = [
    (mkKeymap "n" "<leader>umb" "<cmd>MarkdownPreview<cr>" "Markdown Preview")
    (mkKeymap "n" "<leader>ump" "<cmd>Glow<cr>" "Markdown Preview")
  ];
  extraConfigLua = # lua
    ''
      local ok, md = pcall(require, "hl-mdcodeblock")
      if ok then
        md.setup()
      end
      local ok, g = pcall(require, "glow")
      if ok then
        g.setup()
      end

      vim.cmd([[
      let g:vim_markdown_conceal = 2
      ]])

    '';
}
