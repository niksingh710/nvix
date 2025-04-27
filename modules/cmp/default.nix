{ lib, config, ... }:
{
  highlightOverride = {
    PMenu = {
      ctermbg = "none";
      bg = "none";
    };
  };

  plugins = {
    lspkind.enable = true;
    luasnip.enable = true;

    cmp_luasnip.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        snippet.expand = # lua
          ''
            function(args)
              require("luasnip").lsp_expand(args.body)
            end
          '';
        window = {
          documentation.border = "${config.nvix.border}";
          completion = {
            border = "${config.nvix.border}";
            scrollbar = false;
          };
        };
        sources = [
          { name = "luasnip"; }
          { name = "nvim_lsp"; }
          { name = "nvim_lsp_signature_help"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
    };
  };

  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}")) (attrNames (readDir ./.))
    );
}
