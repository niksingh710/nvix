{
  description = "Nikhil's NixOs / nix-darwin configuration";
  nixConfig = {
    extra-substituters = "https://nvix.cachix.org";
    extra-trusted-public-keys = "nvix.cachix.org-1:VQVR1jCcZUdnVikoe69+7Bjx5omjCLgjJ6dl02X9780=";
  };
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

  outputs = inputs@{ flake-parts, ... }:
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
