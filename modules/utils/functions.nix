{ lib, ... }:
{
  options.nvix.mkKey = lib.mkOption {
    type = lib.types.attrs;
    default = { };
  };
  config.nvix.mkKey = rec {
    # set of functions that returns attrs for keymap List
    mkKeymap = mode: key: action: desc: {
      inherit mode key action;
      options = {
        inherit desc;
        silent = true;
        noremap = true;
        remap = true;
      };
    };

    # Use when no description is to be passed
    mkKeymap' =
      mode: key: action:
      mkKeymap mode key action null;

    # Use when custom options to be passed
    mkKeymapWithOpts =
      mode: key: action: desc: opts:
      (mkKeymap mode key action desc)
      // {
        options = opts;
      };

    lazyKey = key: action: desc: {
      __unkeyed-1 = key;
      __unkeyed-2 = action;
      desc = desc;
    };
    # For which-key icon generation
    # Accepts a list of strings and returns a list of objects
    # [{ __unkeyed, icon, group, hidden <optional boolean> }]
    wKeyObj =
      with builtins;
      list:
      {
        __unkeyed = elemAt list 0;
        icon = elemAt list 1;
        group = elemAt list 2;
      }
      // lib.optionalAttrs (length list > 3) {
        hidden = elemAt list 3;
      };
  };
}
