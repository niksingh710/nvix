{ lib, pkgs, ... }:
{

  performance.byteCompileLua = {
    enable = true;
    plugins = true;
    nvimRuntime = true;
  };

  viAlias = true; # Enable vi alias to run nvim (not enabling vim alias to keep vim independent)

  # If using wayland will ensure that wl-copy is enabled
  clipboard.providers.wl-copy.enable = lib.elem pkgs.system [ "x86_64-linux" "aarch64-linux" ];

}
