{ lib, pkgs, ... }: {
  mkKey = rec {
    mkKeymap = mode: key: action: desc: {
      inherit mode key action;
      options = {
        inherit desc;
        silent = true;
        noremap = true;
        remap = true;
      };
    };
    # Make keymap without description:
    mkKeymap' = mode: key: action: mkKeymap mode key action null;
    mkKeymapWithOpts = mode: key: action: desc: opts:
      (mkKeymap mode key action desc) // {
        options = opts;
      };
  };

  mkPkgs = name: src: pkgs.vimUtils.buildVimPlugin { inherit name src; };

  # For which-key icon generation
  # Accepts a list of strings and returns a list of objects
  # [{ __unkeyed, icon, group, hidden }]
  specObj = with builtins;
    list:
    let
      len = length list;
      first =
        lib.optionalAttrs (elemAt list 0 != "") { __unkeyed = elemAt list 0; };
      second =
        lib.optionalAttrs (elemAt list 1 != "") { icon = elemAt list 1; };
      third = lib.optionalAttrs (len > 2 && elemAt list 2 != "") {
        group = elemAt list 2;
      };
      fourth = lib.optionalAttrs (len > 3 && elemAt list 3 != "") {
        hidden = elemAt list 3;
      };
    in
    first // second // third // fourth;

  icons = import ./icons.nix;
}
