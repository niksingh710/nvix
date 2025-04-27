# This file Contains custom options
# That can be configured via the extend function of nixvim
{ lib, ... }:
with lib;
{
  options = {
    modulesList = mkOption {
      type = types.listOf types.attrs;
    };
    wKeyList = mkOption { type = types.listOf types.attrs; };
    nvix = {
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
  };
}
