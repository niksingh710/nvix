{ lib, ... }:
{
  extraConfigLua = # lua
    ''
      vim.cmd([[hi StatusLine guibg=NONE ctermbg=NONE]])
    '';
  plugins.lualine = {
    enable = true;
    settings =
      let
        separators = {
          left = "";
          right = "";
        };
        transparent = {
          a.fg = "none";
          c.bg = "none";
        };

      in
      {
        options = {
          theme = {
            normal = transparent;
            insert = transparent;
            visual = transparent;
            replace = transparent;
            command = transparent;
            inactive = transparent;
          };
          always_divide_middle = true;
          globalstatus = true;
          icons_enable = true;
          component_separators = separators;
          section_separators = separators;
          disabled_filetypes = [
            "Outline"
            "neo-tree"
            "dashboard"
            "snacks_dashboard"
            "snacks_terminal"
          ];
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
