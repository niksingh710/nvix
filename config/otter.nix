{ pkgs, ... }: { extraPlugins = with pkgs.vimPlugins; [ otter-nvim ]; }
