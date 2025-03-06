{
  description = "A nixvim configuration";
  # TODO: work on startup time
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

    buffer-manager = {
      url = "github:j-morano/buffer_manager.nvim";
      flake = false;
    };

    oil-vcs-status = {
      url = "github:SirZenith/oil-vcs-status";
      flake = false;
    };

    oil-lsp-diagnostics = {
      url = "github:JezerM/oil-lsp-diagnostics.nvim";
      flake = false;
    };

    tokyodark = {
      url = "github:tiagovla/tokyodark.nvim";
      flake = false;
    };

    md-pdf = {
      url = "github:arminveres/md-pdf.nvim";
      flake = false;
    };

  };

  outputs =
    { nixvim, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      imports = [
        ./modules
        ./default.nix
      ];
    };
}
