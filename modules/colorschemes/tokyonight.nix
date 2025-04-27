{ config, ... }:
{
  colorschemes.tokyonight = {
    enable = true;
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
      on_highlights = # lua
        ''
          function(hl, c)
              local prompt = "#2d3149"
              hl.TelescopeNormal = {
                bg = c.bg_dark,
                fg = c.fg_dark,
              }
              hl.TelescopeBorder = {
                bg = c.bg_dark,
                fg = c.bg_dark,
              }
              hl.TelescopePromptNormal = {
                bg = prompt,
              }
              hl.TelescopePromptBorder = {
                bg = prompt,
                fg = prompt,
              }
              hl.TelescopePromptTitle = {
                bg = prompt,
                fg = prompt,
              }
              hl.TelescopePreviewTitle = {
                bg = c.bg_dark,
                fg = c.bg_dark,
              }
              hl.TelescopeResultsTitle = {
                bg = c.bg_dark,
                fg = c.bg_dark,
              }
            end
        '';
    };
  };
}
