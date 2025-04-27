{ lib, pkgs, ... }:
{

  performance.byteCompileLua = {
    enable = true;
    plugins = true;
    nvimRuntime = true;
  };

  vimAlias = true; # Enable vim alias to run nvim

  # If using wayland will ensure that wl-copy is enabled
  clipboard.providers.wl-copy.enable = lib.elem pkgs.system [
    "x86_64-linux"
    "aarch64-linux"
  ];

}
