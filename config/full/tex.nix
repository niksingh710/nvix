{ specObj, pkgs, ... }:
{
  plugins = {
    lsp.servers.texlab.enable = true;
    vimtex = {
      enable = true;
      texlivePackage = pkgs.texlive.combined.scheme-full;
    };
  };

  globals = {
    maplocalleader = " t"; # Set the local leader to "<leader>t"
  };

  wKeyList = [
    (specObj [ "<leader>t" "" "tex" ])
    (specObj [ "<leader>tl" "" "vimtex" ])
  ];
}
