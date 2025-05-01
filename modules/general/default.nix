{
  config,
  helpers,
  lib,
  ...
}:
let
  inherit (config.nvix) icons;
in
{
  luaLoader.enable = false;
  dependencies = {
    gcc.enable = true;
  };

  globals = {
    mapleader = config.nvix.leader; # sets <space> as my leader key
    floating_window_options.border = config.nvix.border;
  };

  opts = {

    clipboard = "unnamedplus";
    cursorline = true;
    cursorlineopt = "number";

    pumblend = 0;
    pumheight = 10;

    expandtab = true;
    shiftwidth = 2;
    smartindent = true;
    tabstop = 2;
    softtabstop = 2;

    ignorecase = true;
    smartcase = true;
    mouse = "a";
    cmdheight = 0;

    number = true;
    relativenumber = true;
    numberwidth = 2;
    ruler = false;

    signcolumn = "yes";
    splitbelow = true;
    splitright = true;
    splitkeep = "screen";
    termguicolors = true;

    conceallevel = 2;

    undofile = true;

    wrap = false;

    virtualedit = "block";
    winminwidth = 5;
    fileencoding = "utf-8";
    list = true;
    smoothscroll = true;
    autoread = true;
    fillchars = {
      eob = " ";
    };

    updatetime = 500;
  };

  autoCmd = [
    {
      desc = "Highlight on yank";
      event = [ "TextYankPost" ];
      callback =
        helpers.mkRaw # lua
          ''
            function()
              vim.highlight.on_yank()
            end
          '';
    }
  ];

  extraLuaPackages = lp: with lp; [ luarocks ];
  extraConfigLua =
    with icons.diagnostics;
    # lua
    ''
      vim.opt.whichwrap:append("<>[]hl")
      vim.opt.listchars:append("space:·")

      -- below part set's the Diagnostic icons/colors
      local signs = {
        Hint = "${BoldHint}",
        Info = "${BoldInformation}",
        Warn = "${BoldWarning}",
        Error = "${BoldError}",
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    '';
  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}")) (attrNames (readDir ./.))
    );
}
