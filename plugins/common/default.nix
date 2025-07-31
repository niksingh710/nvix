# This is common neovim settings with basic plugin sets
{ config, lib, ... }:
let
  inherit (config.nvix) icons;
  inherit (lib.nixvim) mkRaw;
in
{
  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}")) (attrNames (readDir ./.))
    );
  luaLoader.enable = false;

  extraConfigLua =
    with icons.diagnostics;
    # lua
    ''
      local function my_paste(reg)
        return function(lines)
          local content = vim.fn.getreg('"')
          return vim.split(content, '\n')
        end
      end
      if (os.getenv('SSH_TTY') ~= nil)
        then
          vim.g.clipboard = {
            name = 'OSC 52',
            copy = {
              ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
              ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
            },
            paste = {
              ["+"] = my_paste("+"),
              ["*"] = my_paste("*"),
            },
          }
        end



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
    autowrite = true;
    swapfile = false;
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
        mkRaw # lua
          ''
            function()
              vim.highlight.on_yank()
            end
          '';
    }
    {
      desc = "Check file changes";
      event = [ "FocusGained" "BufEnter" "CursorHold" ];
      pattern = [ "*" ];
      callback = mkRaw # lua
        ''
          function()
            if vim.fn.mode() ~= "c" then
              vim.cmd("checktime")
            end
          end
        '';
    }
  ];

  extraLuaPackages = lp: with lp; [ luarocks ];
}
