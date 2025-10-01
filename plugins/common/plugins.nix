{ pkgs, config, ... }:
let
  inherit (config.nvix.mkKey) mkKeymap;
in
{
  extraPlugins = with pkgs.vimPlugins; [ stay-centered-nvim ];
  plugins = {
    # Must have plugins to have a decent flow of work
    comment = {
      enable = true;
      settings = {
        toggler.line = "<leader>/";
        opleader.line = "<leader>/";
      };
    };
    tmux-navigator.enable = true;
    smart-splits.enable = true;
    web-devicons.enable = true;
    nvim-surround.enable = true;
    nvim-autopairs.enable = true;
    trim.enable = true;
    lz-n.enable = true;
    flash = {
      enable = true;
      settings = {
        modes.char.enabled = false;
      };
    };
    visual-multi.enable = true;
    which-key = {
      enable = true;
      settings.spec = config.wKeyList;
      settings.preset = "helix";
    };
  };
  opts = {
    timeout = true;
    timeoutlen = 250;
  };
  keymaps = [
    (mkKeymap "n" "<leader>vt" "<cmd>:lua require('flash').treesitter()<cr>" "Select Treesitter Node")
    (mkKeymap "n" "<leader>ut" ":TrimToggle<cr>" "Toggle Trim")
  ];
}
