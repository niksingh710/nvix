{ pkgs, inputs, mkKey, ... }:
let inherit (mkKey) mkKeymap;
in {

  plugins.markdown-preview = { enable = true; };
  extraPackages = with pkgs; [ pandoc ];
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
      local ok, mv = pcall(require, "markview")
      if ok then
        mv.setup({
          modes = { "n", "c" },
          hybrid_modes = { "n" },

          callbacks = {
            on_enable = function (_, win)
              vim.wo[win].conceallevel = 2;
              -- This will prevent Tree-sitter concealment being disabled on the cmdline mode
              vim.wo[win].concealcursor = "c";
            end
          }
        })
      end

      local ok,mdpdf = pcall(require, "md-pdf")
      if ok then
        mdpdf.setup({
          toc = false
        })
      end
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
