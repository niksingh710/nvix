{ lib, pkgs, ... }:
{
  plugins.lsp.servers.nil_ls = {
    enable = true;
    settings.formatting.command = [ "${lib.getExe pkgs.nixpkgs-fmt}" ];
  };
}
