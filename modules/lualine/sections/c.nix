{ config, helpers, ... }:
let
  inherit (config.nvix) icons;
in
{

  plugins.lualine.settings.sections.lualine_c = [
    {
      __unkeyed = "b:gitsigns_head";
      icon = "${icons.git.Branch}";
      color.gui = "bold";
    }
    {
      __unkeyed = "diff";
      source =
        helpers.mkRaw # lua
          ''
            (function()
              local gitsigns = vim.b.gitsigns_status_dict
              if vim.b.gitsigns_status_dict then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end)
          '';
      symbols = {
        added = helpers.mkRaw ''"${icons.git.LineAdded}" .. " " '';
        modified = helpers.mkRaw ''"${icons.git.LineModified}".. " "'';
        removed = helpers.mkRaw ''"${icons.git.LineRemoved}".. " "'';
      };
    }

    {
      __unkeyed = "diagnostics";
      sources = {
        __unkeyed = "nvim_diagnostic";
      };
      symbols = {
        error = helpers.mkRaw ''"${icons.diagnostics.BoldError}" .. " "'';
        warn = helpers.mkRaw ''"${icons.diagnostics.BoldWarning}" .. " "'';
        info = helpers.mkRaw ''"${icons.diagnostics.BoldInformation}" .. " "'';
        hint = helpers.mkRaw ''"${icons.diagnostics.BoldHint}" .. " "'';
      };
    }
  ];
}
