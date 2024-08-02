{ pkgs, inputs, ... }: {
  extraConfigLua = # lua
    ''
      local ok, _ = pcall(require, "ts-comments")
      if ok then
        require("ts-comments").setup()
      end
    '';
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "ts-comments";
      src = inputs.ts-comments;
    })
  ];
  plugins = {
    ts-autotag.enable = true;
    lsp.servers = {
      tsserver.enable = true;
      vuels.enable = true;
      tailwindcss.enable = true;
      svelte.enable = true;
      jsonls.enable = true;
      html.enable = true;
      eslint.enable = true;
      emmet-ls.enable = true;
      cssls.enable = true;
      biome.enable = true;
    };
    none-ls.sources = {
      formatting = {
        prettierd = {
          enable = true;
          settings = # lua
            ''
              {
                filetypes = {
                  -- "javascript", -- now done by biome
                  -- "javascriptreact", -- now done by biome
                  -- "typescript", -- now done by biome
                  -- "typescriptreact", -- now done by biome
                  -- "json", -- now done by biome
                  -- "jsonc", -- now done by biome
                  "vue",
                  "css",
                  "scss",
                  "less",
                  "html",
                  "yaml",
                  "markdown",
                  "markdown.mdx",
                  "graphql",
                  "handlebars",
                },
              }
            '';
        };
      };
    };
  };
}
