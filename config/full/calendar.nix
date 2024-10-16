{ mkPkgs, inputs, config, pkgs, lib, ... }: with lib;
{
  options.calendar = mkEnableOption "Calendar";
  config = mkIf config.calendar {
    extraPlugins = [
      (mkPkgs "calendar" inputs.calendar)
    ];

    extraPackages = with pkgs;[ python3 ];

    extraConfigLua = # lua
      ''
        local file_exists = function(file)
          local f = io.open(file, "rb")
          if f then
            f:close()
          end
          return f ~= nil
        end

        if file_exists(os.getenv("HOME") .. "/.config/calendar.vim/credentials.vim") then
          vim.cmd([[
            let g:calendar_google_calendar = 1
            let g:calendar_google_task = 1
            source ~/.config/calendar.vim/credentials.vim
            ]])
        end
      '';
  };
}
