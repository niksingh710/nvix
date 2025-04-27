{ helpers, ... }:
{
  plugins.lualine.settings.sections.lualine_x = [
    {
      color = {
        fg = "#ff9e64";
      };
      cond = helpers.mkRaw ''
        function()
          local ok, noice = pcall(require, "noice")
          if not ok then
            return false
          end
          return noice.api.status.mode.has()
        end
      '';
      __unkeyed =
        helpers.mkRaw # lua
          ''
            function()
              local ok, noice = pcall(require, "noice")
              if not ok then
                return false
              end
              return noice.api.status.mode.get()
            end
          '';
    }
    {
      __unkeyed =
        helpers.mkRaw # lua
          ''
            function()
              local clients = vim.lsp.get_clients()
              local lsp_names = {}
              if next(clients) == nil then
                return "Ls Inactive"
              end
              for _, client in ipairs(clients) do
                if client.name ~= "copilot" and client.name ~= "null-ls" and client.name ~= "typos_lsp" then
                  local name = client.name:gsub("%[%d+%]", "") -- makes otter-ls[number] -> otter-ls
                  table.insert(lsp_names, name)
                end
              end

              local formatters = require("conform").list_formatters()
              local con_names = {}

              for _, formatter in ipairs(formatters) do
                local name = formatter.name
                if formatter.available and (name ~= "squeeze_blanks" and name ~= "trim_whitespace" and name ~= "trim_newlines") then
                  table.insert(con_names, formatter.name)
                end
              end
              local names = {}
              vim.list_extend(names, lsp_names)
              vim.list_extend(names, con_names)
              return "[" .. table.concat(vim.fn.uniq(names), ", ") .. "]"
            end
          '';
    }

    {
      __unkeyed = "filetype";
      cond = null;
      padding = {
        left = 1;
        right = 1;
      };
    }
  ];
}
