{ lib, pkgs, ... }:
let formatter = [ "shellcheck" "shellharden" "shfmt" ];
in {
  plugins = {
    lsp.servers.bashls.enable = true;
    conform-nvim.settings = {
      formatters_by_ft = {
        bash = formatter;
        sh = formatter;
        zsh = formatter;
      };
      formatters = {
        shellcheck = { command = lib.getExe pkgs.shellcheck; };
        shfmt = { command = lib.getExe pkgs.shfmt; };
        shellharden = { command = lib.getExe pkgs.shellharden; };
      };
    };
  };
}
