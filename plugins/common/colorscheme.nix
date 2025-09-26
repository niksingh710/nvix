{ config, ... }:
{
  colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        integrations.native_lsp = {
          enabled = true;
          underlines = {
            errors = [ "undercurl" ];
            hints = [ "undercurl" ];
            warnings = [ "undercurl" ];
            information = [ "undercurl" ];
          };
        };
        flavor = "mocha";
        italic = true;
        bold = true;
        dimInactive = false;
        transparent_background = true;
      };
    };
  };

  colorschemes.tokyonight = {
    enable = false;
    settings = {
      style = "night";
      transparent = config.nvix.transparent;
      styles = {
        floats = if config.nvix.transparent then "transparent" else "dark";
        sidebars = if config.nvix.transparent then "transparent" else "dark";
        comments.italic = true;
        functions.italic = true;
        variables.italic = true;
        keywords = {
          italic = true;
          bold = true;
        };
      };
    };
  };
}
