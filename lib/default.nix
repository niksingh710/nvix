{
  mkKey = rec {
    mkKeymap = mode: key: action: desc: {
      inherit mode key action;
      options = {
        inherit desc;
        silent = true;
        noremap = true;
      };
    };
    # Make keymap without description:
    mkKeymap' =
      mode: key: action:
      mkKeymap mode key action null;
    mkKeymapWithOpts =
      mode: key: action: desc: opts:
      (mkKeymap mode key action desc) // { options = opts; };
  };
  icons = import ./icons.nix;
}
