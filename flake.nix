{
  description = "Description for the project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    buffer-manager = {
      url = "github:j-morano/buffer_manager.nvim";
      flake = false;
    };

    minty = {
      url = "github:NvChad/minty";
      flake = false;
    };

    volt = {
      url = "github:NvChad/volt";
      flake = false;
    };

    nvim-window-picker = {
      url = "github:s1n7ax/nvim-window-picker";
      flake = false;
    };

    rnoweb = {
      url = "github:bamonroe/rnoweb-nvim";
      flake = false;
    };

    md-pdf = {
      url = "github:arminveres/md-pdf.nvim";
      flake = false;
    };

    windows = {
      url = "github:anuvyklack/windows.nvim";
      flake = false;
    };
    windows-mc = {
      url = "github:anuvyklack/middleclass";
      flake = false;
    };
    windows-a = {
      url = "github:anuvyklack/animation.nvim";
      flake = false;
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ./pkgs ./variables ];
      debug = true;
      systems =
        [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
    };
}
