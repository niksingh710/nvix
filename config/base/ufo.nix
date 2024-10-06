# This plugin handles folding.
{ mkKey, helpers, ... }:
let inherit (mkKey) mkKeymap;
in {
  autoCmd = [
    {
      event = [ "BufEnter" "BufNew" ];
      desc = "disable statuscolumn for neo-tree and dashboard";
      callback = (helpers.mkRaw ''
        function()
          local ft_ignore = { "dashboard", "neo-tree" }
          if vim.tbl_contains(ft_ignore, vim.bo.filetype) then
            vim.cmd("setlocal foldcolumn=0")
          end
        end
      '');
    }
  ];

  plugins = {
    statuscol = {
      enable = true;
      settings = {
        relculright = true;
        ft_ignore = [ "dashboard" "neo-tree" ];
        segments = [
          {
            click = "v:lua.ScFa";
            text = [ (helpers.mkRaw "require('statuscol.builtin').foldfunc") ];
          }
          {
            click = "v:lua.ScSa";
            text = [ " %s" ];
          }
          {
            click = "v:lua.ScLa";
            text = [ (helpers.mkRaw "require('statuscol.builtin').lnumfunc") " " ];
          }
        ];
      };
    };
    nvim-ufo = {
      enable = true;
      providerSelector = # lua
        ''
          function()
            return { "lsp", "indent" }
          end
        '';
      preview.mappings = {
        close = "q";
        switch = "K";
      };
    };
  };
  opts = {
    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;
    fillchars = (helpers.mkRaw "[[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]");
  };

  keymaps = [
    (mkKeymap "n" "zR"
      (helpers.mkRaw ''function() require("ufo").openAllFolds() end'')
      "Open all folds")
    (mkKeymap "n" "zM"
      (helpers.mkRaw ''function() require("ufo").closeAllFolds() end'')
      "Close All Folds")
    (mkKeymap "n" "zK"
      (helpers.mkRaw ''
        function() local winid = require("ufo").peekFoldedLinesUnderCursor() if not winid then vim.lsp.buf.hover() end end'')
      "Peek Folded Lines")
  ];
}
