{ config, helpers, ... }:
let
  inherit (config.nvix) icons;
in
{
  plugins.lualine.settings.sections.lualine_z = [
    "location"
    {
      __unkeyed =
        helpers.mkRaw # lua
          ''
            function()
              local lsp_clients = vim.lsp.get_clients()
              for _, client in ipairs(lsp_clients) do
                if client.name == "copilot" then
                  return "%#SLGreen#" .. "${icons.kind.Copilot}"
                end
              end
               return ""
            end
          '';
    }
  ];

}
