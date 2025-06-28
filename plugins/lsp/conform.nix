# Formatter with lsp fallback
{ lib, pkgs, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      default_format_opts.lsp_format = "prefer";
      formatters_by_ft = {
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };
      formatters.squeeze_blanks.command = lib.getExe' pkgs.coreutils "cat";
    };
  };
}
