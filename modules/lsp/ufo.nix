{ helpers, ... }:
{
  plugins = {
    nvim-ufo = {
      enable = true;
      settings = {
        provider_selector = # lua
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
  };

  opts = {
    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;
    fillchars = helpers.mkRaw ''[[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]'';
  };

  autoCmd = [{
    event = [ "BufEnter" "BufNew" ];
    desc = "disable statuscolumn for neo-tree and dashboard";
    callback = (helpers.mkRaw ''
      function()
        local ft_ignore = { "dashboard", "neo-tree", "snacks_dashboard" }
        if vim.tbl_contains(ft_ignore, vim.bo.filetype) then
          vim.cmd("setlocal foldcolumn=0")
        end
      end
    '');
  }];
}
