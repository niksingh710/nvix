{ lib, ... }:
with lib; {
  flake = {
    options = {
      opts = {
        border = mkOption {
          type = types.str;
          default = "rounded";
          description = "The type of border to be used.";
        };
        winblend = mkOption {
          type = types.int;
          default = 12;
          description = "The blend of other windows.";
        };

        transparent = mkEnableOption "transparent";
      };
    };
  };
}
