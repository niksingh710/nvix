{ opts, helpers, ... }: {
  highlightOverride = {
    PMenu = {
      ctermbg = "none";
      bg = "none";
    };
  };
  # colorschemes.rose-pine.enable = true;
  plugins = {
    lspkind.enable = true;
    luasnip.enable = true;

    cmp_luasnip.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        formatting.fields = [ "kind" "menu" "abbr" ];
        snippet.expand = # lua
          ''
            function(args)
              require("luasnip").lsp_expand(args.body)
            end
          '';
        window = {
          documentation.border = "${opts.border}";
          completion = {
            border = "${opts.border}";
            scrollbar = false;
          };
        };
        sources = [
          { name = "cmp_luasnip"; }
          { name = "luasnip"; }
          { name = "nvim_lsp"; }
          { name = "nvim_lsp_signature_help"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping = (helpers.mkRaw # lua
          ''
            cmp.mapping.preset.insert({
              ["<C-k>"] = cmp.mapping.select_prev_item(),
              ["<C-j>"] = cmp.mapping.select_next_item(),

              ["<c-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
              ["<c-d>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

              ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),

              ["<c-CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
              }),

              -- Enter to accept the completion or fallback
              ["<CR>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.confirm({ select = true }) -- Accept currently selected completion
                else
                  fallback() -- Default Enter behavior when no completion menu is visible
                end
              end, { "i", "s" }),

              ["<c-h>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                  fallback()
                end
              end, { "i", "s" }),

              ["<c-l>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                else
                  fallback()
                end
              end, { "i", "s" }),


              ["<c-space>"] = cmp.mapping(function(fallback)
                local copk = require("copilot")
                  
                if copk then
                  vim.g.copilot_no_tab_map = true
                  vim.g.copilot_assume_mapped = true
                  vim.g.copilot_tab_fallback = ""

                  local suggestion = require("copilot.suggestion")
                  if suggestion.is_visible() then
                    suggestion.accept()
                  else
                    fallback()
                  end
                end
              end,{ "i", "s" }),
            })
          '');
      };
    };
  };
}
