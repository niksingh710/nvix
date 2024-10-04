{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        incremental_selection.enable = true;
        indent.enable = true;
      };
    };
    treesitter-textobjects = { enable = true; };
    mini.enable = true;
    indent-blankline = {
      enable = true;
      settings = {
        indent.char = "│";
        exclude.filetypes = [ "''" "lspinfo" "dashboard" "checkhealth" ];
      };
    };
  };
  extraConfigLua = ''
    require('mini.indentscope').setup({
      symbol = "│",
    })
  '';
}

