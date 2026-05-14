{ config, ... }:
{
  colorschemes = {
    kanagawa = {
      enable = true;
      settings = {
        colors.theme.all.ui.bg_gutter = "none";
        undercurl = true;
        transparent = config.nvix.transparent;
        theme = "dragon";
        background = {
          dark = "dragon";
          light = "lotus";
        };
        commentStyle.italic = true;
        keywordStyle.italic = true;
        statementStyle.bold = true;
        overrides = # lua
          ''
            function(colors)
                local theme = colors.theme
                local makeDiagnosticColor = function(color)
                local c = require("kanagawa.lib.color")
                  return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
                end
                return {
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none" },
                    FloatTitle = { bg = "none" },
                    NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                    Pmenu = { fg = theme.ui.shade0, bg = "none", blend = vim.o.pumblend },
                    PmenuSel = { fg = "NONE", bg = "none" },
                    PmenuSbar = { bg = "none" },
                    BlinkCmpMenuBorder = { bg = "none" },
                    DiagnosticVirtualTextHint  = makeDiagnosticColor(theme.diag.hint),
                    DiagnosticVirtualTextInfo  = makeDiagnosticColor(theme.diag.info),
                    DiagnosticVirtualTextWarn  = makeDiagnosticColor(theme.diag.warning),
                    DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
                    TabLineFill = { bg = "none" },
                    TabLine = { bg = "none" },
                    TabLineSel = { bg = "none" },
                    TreesitterContext = { bg ="none",  ctermbg="none" },
                }
            end
          '';
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
