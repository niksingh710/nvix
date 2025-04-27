{ config, lib, ... }:
let
  inherit (config.nvix) icons;
  inherit (config.nvix.mkKey) wKeyObj;
in
{
  plugins.gitsigns = {
    enable = true;
    settings = {
      current_line_blame = true;
      signs = with icons.ui; {
        add.text = "${LineLeft}";
        change.text = "${LineLeft}";
        delete.text = "${LineLeft}";
        topdelete.text = "${Triangle}";
        changedelete.text = "${BoldLineLeft}";
      };
    };
  };

  wKeyList = [
    (wKeyObj [
      "<leader>g"
      ""
      "git"
    ])
    (wKeyObj [
      "<leader>gh"
      "󰫅"
      "hunks"
    ])
    (wKeyObj [
      "<leader>gb"
      "󰭐"
      "blame"
    ])
  ];

  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}")) (attrNames (readDir ./.))
    );
}
