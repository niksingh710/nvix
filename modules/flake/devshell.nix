{ inputs, ... }:
{
  imports = [
    (inputs.git-hooks + /flake-module.nix)
  ];
  perSystem =
    { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell rec {
        name = "nvix";
        meta.description = "Dev environment for nixvim-config";
        inputsFrom = [ config.pre-commit.devShell ];
        packages = with pkgs; [
          just
          nil
          nix-output-monitor
          nixfmt-rfc-style
        ];
        shellHook = ''
          echo 1>&2 "🐼: $(id -un) | 🧬: $(nix eval --raw --impure --expr 'builtins.currentSystem') | 🐧: $(uname -r) "
          echo 1>&2 "Ready to work on ${name}!"
        '';
      };

      pre-commit.settings = {
        hooks.nixfmt-rfc-style.enable = true;
      };
    };
}
