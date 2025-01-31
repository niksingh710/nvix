{ inputs, self, ... }: {
  perSystem = { pkgs, system, ... }:
    let
      inherit (inputs) nixvim;
      extraSpecialArgs = {
        inherit inputs self; # This will ensure all inputs are available in the module
      };

      nvix = type: {
        inherit pkgs extraSpecialArgs;
        module = import ./config/${type}.nix;
      };
      check = nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule;
      package = nixvim.legacyPackages.${system}.makeNixvimWithModule;
    in
    {
      # Run `nix flake check .` to verify that your config is not broken
      checks = rec {
        default = check (nvix "core") // { meta.description = "Checks if default builds fine."; };
        core = default // { meta.description = "Checks if core builds fine."; };
        bare = check (nvix "bare") // { meta.description = "Checks if bare builds fine"; };
        full = check (nvix "full") // { meta.description = "Checks if full builds fine"; };
      };
      # Lets you run `nix run .` to start nixvim
      packages = rec {
        default = package (nvix "core") // { meta.description = "-> core"; };
        core = default // { meta.description = "Balanced for regular usage"; };
        bare = package (nvix "bare") // { meta.description = "Minimal for servers/quick spin."; };
        full = package (nvix "full") // { meta.description = "Full utility set with tex support."; };
      };
      formatter = pkgs.nixpkgs-fmt;
    };
}
