{opts,mkKey,...}:
let
  inherit (mkKey) mkKeymap;
in {
  plugins.nvim-ufo = {
    enable = true;
    openFoldHlTimeout = 0;
    providerSelector = ''
      function()
        return { "lsp", "indent" }
      end
    '';
    preview = {
      winConfig = {
        border = opts.border;
        winblend = 0;
      };
      mappings = {
        close = "q";
        switch = "K";
      };
    };
  };
  keymaps = [
    (mkKeymap "n" "zR" { __raw = ''function() require("ufo").openAllFolds() end''; } "Open all folds" )
    (mkKeymap "n" "zM" { __raw = ''function() require("ufo").closeAllFolds() end''; } "Close All Folds" )
    (mkKeymap "n" "zK" { __raw = ''function() local winid = require("ufo").peekFoldedLinesUnderCursor() if not winid then vim.lsp.buf.hover() end end''; } "Peek Folded Lines" )
  ];
  # Could have been done using `opts` but meh..
  extraConfigLua = ''
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  '';

  plugins.statuscol = {
    enable = true;
    settings = {
      relculright = true;
      ft_ignore = [ "alpha" ];
      segments = [
        {
          click = "v:lua.ScFa";
          text = [
            {
              __raw = "require('statuscol.builtin').foldfunc";
            }
          ];
        }
        {
          click = "v:lua.ScSa";
          text = [
            " %s"
          ];
        }
        {
          click = "v:lua.ScLa";
          text = [
            {
              __raw = "require('statuscol.builtin').lnumfunc";
            }
            " "
          ];
        }
      ];
    };
  };
}
