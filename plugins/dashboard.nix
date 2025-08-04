{ lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
in
{
  plugins.dashboard = {
    enable = true;
    settings = {
      theme = "doom";
      config = {
        vertical_center = true;
        week_header.enable = true;
        center = [
          {
            icon = "";
            desc = " Press";
            key = "o";
            key_format = "-> %s";
            action = mkRaw # lus
              ''
                function()
                  local url = "https://c.xkcd.com/random/comic/"
                  local open_cmd

                  if vim.fn.has("macunix") == 1 then
                    open_cmd = "open"
                  elseif vim.fn.has("unix") == 1 then
                    open_cmd = "xdg-open"
                  elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
                    open_cmd = "start"
                  else
                    vim.notify("Unsupported OS for opening URLs", vim.log.levels.ERROR)
                    return
                  end

                  vim.fn.jobstart({ open_cmd, url }, { detach = true })
                end

              '';
          }
          {
            icon = "󰿅";
            desc = " Quit";
            key = "<leader>q";
            key_format = "-> %s";
            action = "quitall!";
          }
        ];
        packages.enable = false;
        project.enable = false;
        shortcut = [ ];
        mru = {
          cwd_only = true;
          limit = 5;
        };
        footer = [ "" "" ];
      };
    };
  };
}
