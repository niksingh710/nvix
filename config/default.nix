{ pkgs, opts, ... }:
let inherit (pkgs) lib;
in {
  # Import all your configuration modules here
  imports = [
    ./mappings.nix
    ./autocmd.nix
    ./general.nix

    ./tokyodark.nix
    ./bufferline.nix
    ./lualine.nix
    ./ufo.nix
    ./noice.nix

    ./which-key.nix

    ./telescope.nix
    ./treesitter.nix
    ./nvimtree.nix
    ./gitsigns.nix

    ./dashboard.nix
    ./lsp.nix
    ./lang
    ./none-ls.nix
    ./comment.nix
    ./autopairs.nix
    ./cmp.nix
    ./copilot.nix
    ./session.nix

    ./image.nix
    ./otter.nix

    ./firenvim.nix
  ];

  enableMan = true;
  viAlias = true;
  vimAlias = true;

  clipboard.providers.wl-copy.enable = true;

  globals = {
    mapleader = " ";

    floating_window_options = {
      border = "${opts.border}";
      winblend = 10;
    };
  };

  globalOpts.statusline = "%#Normal#";
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

    signcolumn = "yes";
    splitbelow = true;
    splitright = true;
    splitkeep = "screen";
    termguicolors = true;
    timeoutlen = lib.mkDefault 400;

    conceallevel = 2;

    undofile = true;

    wrap = false;

    virtualedit = "block";
    winminwidth = 5;
    fileencoding = "utf-8";
    list = true;
    smoothscroll = true;
    fillchars = { eob = " "; };

    #interval for writing swap file to disk, also used by gitsigns
    updatetime = 550;
  };

  extraLuaPackages = ps: with ps; [ luarocks ];
  extraConfigLua = ''
    vim.opt.whichwrap:append("<>[]hl")
    vim.opt.listchars:append("space:·")
  '';
}
