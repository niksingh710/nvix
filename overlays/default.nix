{ inputs, self, ... }:
{
  flake.overlays.default =
    (final: prev: {
      stable = import inputs.nixpkgs-stable {
        allowUnfree = true;
        inherit (prev) system;
        overlays = prev.lib.attrValues self.overlays;
      };
    });
}
