{ lib, config, ... }:
{
  options.nvix.explorer.oil = lib.mkEnableOption "Enable Oil";
  config = {
    plugins.oil = {
      enable = config.nvix.explorer.oil;
      settings = {
        skip_confirm_for_simple_edits = true;
        experimental_watch_for_changes = true;
        cleanup_delay_ms = 500;
        keymaps = {
          "<s-cr>" = "actions.parent";
          "<" = "actions.parent";
          ">" = "actions.select";
          "<c-d>" = "actions.preview_scroll_down";
          "<c-u>" = "actions.preview_scroll_up";
          "q" = "actions.close";
          "<leader>e" = "actions.close";
          "s" = "actions.select_split";
          "r" = "actions.refresh";
          "gp" = "actions.preview";
          "v" = "actions.select_vsplit";
          "<tab>" = "actions.select_tab";
          "." = "actions.open_cwd";
          "g." = "actions.toggle_hidden";
        };
        float = {
          border = config.nvix.border;
          max_width = 200;
          max_height = 40;
        };

      };
    };
  };
  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}")) (attrNames (readDir ./.))
    );
}
