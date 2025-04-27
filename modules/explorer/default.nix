{ lib, config, ... }:

let
  inherit (config.nvix.mkKey) wKeyObj;
in
{
  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}")) (attrNames (readDir ./.))
    );

  wKeyList = [
    (wKeyObj [
      "<leader>e"
      ""
      "explorer"
    ])
  ];
}
