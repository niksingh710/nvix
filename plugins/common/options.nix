{ lib, ... }:
with lib;
{
  options.wKeyList = mkOption { type = types.listOf types.attrs; };
  options.nvix = {
    mkKey = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
    icons = mkOption {
      type = types.attrs;
      default = { };
    };
    leader = mkOption {
      description = "The leader key for nvim";
      type = types.str;
      default = " ";
    };

    border = mkOption {
      description = "The border style for nvim";
      type = types.enum [
        "single"
        "double"
        "rounded"
        "solid"
        "shadow"
        "curved"
        "bold"
        "none"
      ];
      default = "rounded";
    };

    winblend = mkOption {
      description = "Blending option for the transparent windows";
      type = types.int;
      default = 2;
    };

    transparent = mkEnableOption "transparent" // {
      default = true;
    };
  };
}
