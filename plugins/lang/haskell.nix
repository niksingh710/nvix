{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [ haskell-tools-nvim ];
}
