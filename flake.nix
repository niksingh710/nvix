{
  description = "Nikhil's NixOs / nix-darwin configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";

    systems.url = "github:nix-systems/default";

    # hooks for git
    git-hooks.url = "github:cachix/git-hooks.nix";
    git-hooks.flake = false;
  };

  outputs = inputs@{ flake-parts, self, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      _module.args = { inherit inputs; };
      imports = [
        ./modules/flake
        ./overlays
        ./plugins
      ];
    };
}
