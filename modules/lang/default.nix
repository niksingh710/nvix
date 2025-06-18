{ lib, pkgs, ... }:
let
  isDarwin = pkgs.stdenv.isDarwin;
in
{
  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}")) (attrNames (readDir ./.))
    );
  extraConfigLua = ''
    require('img-clip').setup({})
  '';
  extraPlugins = with pkgs.vimPlugins; [ img-clip-nvim ];
  extraPackages = with pkgs; if isDarwin then [ pngpaste ] else [ wl-clipboard ];
}
