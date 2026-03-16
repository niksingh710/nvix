{ config, ... }:
{
  colorschemes = {
    kanagawa = {
      enable = true;
      settings = {
        compile = false;
        undercurl = true;
        transparent = config.nvix.transparent;
        colors.theme.all.ui.bg_gutter = "none";
        theme = "dragon";
        background = {
          dark = "dragon";
          light = "lotus";
        };
        commentStyle.italic = true;
        keywordStyle.italic = true;
        statementStyle.bold = true;
      };
    };
    catppuccin = {
      enable = false;
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
