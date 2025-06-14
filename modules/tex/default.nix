{
  pkgs,
  config,
  lib,
  ...
}:
let
  inherit (config.nvix.mkKey) mkKeymap wKeyObj;
in
{

  plugins = {
    lsp.servers.texlab.enable = true;
    vimtex = {
      enable = true;
      texlivePackage = pkgs.texlive.combined.scheme-full;
    };
  };

  extraPackages = [ pkgs.python313Packages.pylatexenc ];
  extraConfigLuaPre = ''
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = ".build" -- you can set here whatever name you desire
    }
    vim.g.vimtex_quickfix_ignore_filters = { 'warning' }
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_mappings_enabled = 0
  '';

  globals.maplocalleader = " t"; # Set the local leader to "<leader>t"

  files."ftplugin/tex.lua" = {
    keymaps = [
      (mkKeymap "n" "<localleader>li" "<plug>(vimtex-info)" "VimTeX Info")
      (mkKeymap "n" "<localleader>lI" "<plug>(vimtex-info-full)" "VimTeX Info Full")
      (mkKeymap "n" "<localleader>lt" "<plug>(vimtex-toc-open)" "VimTeX TOC Open")
      (mkKeymap "n" "<localleader>lT" "<plug>(vimtex-toc-toggle)" "VimTeX TOC Toggle")
      (mkKeymap "n" "<localleader>lq" "<plug>(vimtex-log)" "VimTeX Log")
      (mkKeymap "n" "<localleader>lv" "<plug>(vimtex-view)" "VimTeX View")
      (mkKeymap "n" "<localleader>lr" "<plug>(vimtex-reverse-search)" "VimTeX Reverse Search")
      (mkKeymap "n" "<localleader>ll" "<plug>(vimtex-compile)" "VimTeX Compile")
      (mkKeymap "n" "<localleader>lL" "<plug>(vimtex-compile-selected)" "VimTeX Compile Selected")
      (mkKeymap "x" "<localleader>lL" "<plug>(vimtex-compile-selected)" "VimTeX Compile Selected")
      (mkKeymap "n" "<localleader>lk" "<plug>(vimtex-stop)" "VimTeX Stop")
      (mkKeymap "n" "<localleader>lK" "<plug>(vimtex-stop-all)" "VimTeX Stop All")
      (mkKeymap "n" "<localleader>le" "<plug>(vimtex-errors)" "VimTeX Errors")
      (mkKeymap "n" "<localleader>lo" "<plug>(vimtex-compile-output)" "VimTeX Compile Output")
      (mkKeymap "n" "<localleader>lg" "<plug>(vimtex-status)" "VimTeX Status")
      (mkKeymap "n" "<localleader>lG" "<plug>(vimtex-status-all)" "VimTeX Status All")
      (mkKeymap "n" "<localleader>lc" "<plug>(vimtex-clean)" "VimTeX Clean")
      (mkKeymap "n" "<localleader>lC" "<plug>(vimtex-clean-full)" "VimTeX Clean Full")
      (mkKeymap "n" "<localleader>lm" "<plug>(vimtex-imaps-list)" "VimTeX Imaps List")
      (mkKeymap "n" "<localleader>lx" "<plug>(vimtex-reload)" "VimTeX Reload")
      (mkKeymap "n" "<localleader>lX" "<plug>(vimtex-reload-state)" "VimTeX Reload State")
      (mkKeymap "n" "<localleader>ls" "<plug>(vimtex-toggle-main)" "VimTeX Toggle Main")
      (mkKeymap "n" "<localleader>la" "<plug>(vimtex-context-menu)" "VimTeX Context Menu")
    ];
  };

  wKeyList = [
    (wKeyObj [
      "<leader>t"
      ""
      "tex"
    ])
  ];

  # lua code copied from
  # https://github.com/lervag/vimtex/wiki/which-key.nvim-support
  extraConfigLua = # lua # TODO: convert this to nix
    ''
      local wk = require("which-key")
      wk.add({
        buffer = BUFFER, -- e.g. ev.buf or similar
        {
          "<localleader>l",
          group = "VimTeX",
          icon = { icon = "", color = "green" },
          mode = "nx",
        },
        {
          mode = "n",
          {
            "<localleader>ll",
            "<plug>(vimtex-compile)",
            desc = "Compile",
            icon = { icon = "", color = "green" },
          },
          {
            "<localleader>lL",
            "<plug>(vimtex-compile-selected)",
            desc = "Compile selected",
            icon = { icon = "", color = "green" },
            mode = "nx",
          },
          {
            "<localleader>li",
            "<plug>(vimtex-info)",
            desc = "Information",
            icon = { icon = "", color = "purple" },
          },
          {
            "<localleader>lI",
            "<plug>(vimtex-info-full)",
            desc = "Full information",
            icon = { icon = "󰙎", color = "purple" },
          },
          {
            "<localleader>lt",
            "<plug>(vimtex-toc-open)",
            desc = "Table of Contents",
            icon = { icon = "󰠶", color = "purple" },
          },
          {
            "<localleader>lT",
            "<plug>(vimtex-toc-toggle)",
            desc = "Toggle table of Contents",
            icon = { icon = "󰠶", color = "purple" },
          },
          {
            "<localleader>lq",
            "<plug>(vimtex-log)",
            desc = "Log",
            icon = { icon = "", color = "purple" },
          },
          {
            "<localleader>lv",
            "<plug>(vimtex-view)",
            desc = "View",
            icon = { icon = "", color = "green" },
          },
          {
            "<localleader>lr",
            "<plug>(vimtex-reverse-search)",
            desc = "Reverse search",
            icon = { icon = "", color = "purple" },
          },
          {
            "<localleader>lk",
            "<plug>(vimtex-stop)",
            desc = "Stop",
            icon = { icon = "", color = "red" },
          },
          {
            "<localleader>lK",
            "<plug>(vimtex-stop-all)",
            desc = "Stop all",
            icon = { icon = "󰓛", color = "red" },
          },
          {
            "<localleader>le",
            "<plug>(vimtex-errors)",
            desc = "Errors",
            icon = { icon = "", color = "red" },
          },
          {
            "<localleader>lo",
            "<plug>(vimtex-compile-output)",
            desc = "Compile output",
            icon = { icon = "", color = "purple" },
          },
          {
            "<localleader>lg",
            "<plug>(vimtex-status)",
            desc = "Status",
            icon = { icon = "󱖫", color = "purple" },
          },
          {
            "<localleader>lG",
            "<plug>(vimtex-status-full)",
            desc = "Full status",
            icon = { icon = "󱖫", color = "purple" },
          },
          {
            "<localleader>lc",
            "<plug>(vimtex-clean)",
            desc = "Clean",
            icon = { icon = "󰃢", color = "orange" },
          },
          {
            "<localleader>lh",
            "<Cmd>VimtexClearCache ALL<cr>",
            desc = "Clear all cache",
            icon = { icon = "󰃢", color = "grey" },
          },
          {
            "<localleader>lC",
            "<plug>(vimtex-clean-full)",
            desc = "Full clean",
            icon = { icon = "󰃢", color = "red" },
          },
          {
            "<localleader>lx",
            "<plug>(vimtex-reload)",
            desc = "Reload",
            icon = { icon = "󰑓", color = "green" },
          },
          {
            "<localleader>lX",
            "<plug>(vimtex-reload-state)",
            desc = "Reload state",
            icon = { icon = "󰑓", color = "cyan" },
          },
          {
            "<localleader>lm",
            "<plug>(vimtex-imaps-list)",
            desc = "Input mappings",
            icon = { icon = "", color = "purple" },
          },
          {
            "<localleader>ls",
            "<plug>(vimtex-toggle-main)",
            desc = "Toggle main",
            icon = { icon = "󱪚", color = "green" },
          },
          {
            "<localleader>la",
            "<plug>(vimtex-context-menu)",
            desc = "Context menu",
            icon = { icon = "󰮫", color = "purple" },
          },
        }
      })
    '';

  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}")) (attrNames (readDir ./.))
    );
}
