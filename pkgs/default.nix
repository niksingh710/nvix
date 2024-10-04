{ inputs, self, lib, ... }: {
  perSystem = { pkgs, self', system, ... }:
    let
      extraSpecialArgs = {
        inherit inputs;
        inherit (self) opts;
      } // import "${self}/lib" { inherit lib pkgs; };
      modules = imports:
        inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
          inherit pkgs extraSpecialArgs;
          module = { inherit imports; };
        };

      bare = [ "${self}/config/core" ];
      base = bare ++ [ "${self}/config/base" "${self}/lang" ];
    in
    {

      packages = {
        bare = modules bare;
        base = modules base;
        default = self'.packages.base;
      };
    };
}
