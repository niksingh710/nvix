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
        default = check (nvix "core");
        core = default;
        bare = check (nvix "bare");
        full = check (nvix "full");
      };
      # Lets you run `nix run .` to start nixvim
      packages = rec {
        default = package (nvix "core");
        core = default;
        bare = package (nvix "bare");
        full = package (nvix "full");
      };
      formatter = pkgs.nixpkgs-fmt;
    };
}
