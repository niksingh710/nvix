{
  plugins.nvim-autopairs = {
    enable = true;
    settings = {
      fast_wrap = { };
      disable_filetype = [ "TelescopePrompt" "vim" ];
    };
  };
  extraConfigLua = # lua
    ''
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")

      npairs.add_rule(Rule("$$", "$$", "tex"))

    '';
}
