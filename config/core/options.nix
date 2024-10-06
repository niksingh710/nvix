{ lib, pkgs, opts, ... }:
with lib; {
  enableMan = true;
  viAlias = true;
  vimAlias = true;

  clipboard.providers.wl-copy.enable = pkgs.system == "x86_64-linux";

  globals = {
    mapleader = " ";
    floating_window_options = {
      border = "${opts.border}";
      inherit (opts) winblend;
    };
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
    timeoutlen = mkDefault 400;
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
    scrolloff = 999;
    fillchars = { eob = " "; };

    #interval for writing swap file to disk, also used by gitsigns
    updatetime = 250;

  };
  extraLuaPackages = ps: with ps; [ luarocks ];
  extraConfigLua = # lua
    ''
      vim.opt.whichwrap:append("<>[]hl")
      vim.opt.listchars:append("space:·")
    '';
}
