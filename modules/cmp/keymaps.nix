{ helpers, ... }:
{
  plugins.cmp.settings.mapping = (
    helpers.mkRaw # lua
      ''
        cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),

          ["<c-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
          ["<c-d>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

          ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),

          ["<C-cr>"] = cmp.mapping.confirm ( { select = true } ),

          ["<C-l>"] = cmp.mapping(function(fallback)
            local luasnip = require("luasnip")
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<C-h>"] = cmp.mapping(function(fallback)
            local luasnip = require("luasnip")
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ---@diagnostic disable-next-line
          ["<c-space>"] = cmp.mapping(function()
            local ok,_ = pcall(require, "copilot")
            if ok then
              vim.g.copilot_no_tab_map = true
              vim.g.copilot_assume_mapped = true
              vim.g.copilot_tab_fallback = ""

              local suggestion = require("copilot.suggestion")
              if suggestion.is_visible() then
                suggestion.accept()
              else
                cmp.mapping.complete()
              end
            end
          end,{ "i", "s" }),
        })
      ''
  );
}
