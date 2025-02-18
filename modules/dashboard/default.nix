{ helpers, ... }:
{
  plugins.dashboard = {
    enable = true;
    settings = {
      change_to_vcs_root = true;
      config = {
        packages.enable = false;
        footer = [
          ""
          "Made with ❤️"
          ""
        ];
        mru.limit = 5;
        week_header.enable = true;
        project.enable = true;
        shortcut = [
          {
            action = helpers.mkRaw "function() Snacks.picker.files() end";
            desc = "Files";
            group = "Label";
            icon = " ";
            icon_hl = "@variable";
            key = "f";
          }
          {
            action = "SessionRestore";
            desc = "󰝳 Session";
            group = "Number";
            key = ".";
          }
          {
            action = helpers.mkRaw "function() Snacks.picker.recent() end";
            desc = "󱦠 Recent Files";
            group = "DiagnosticHint";
            key = "r";
          }
          {
            action = "quitall!";
            desc = "󰈆 Quit";
            group = "DiagnosticError";
            key = "q";
          }
        ];
      };
      theme = "hyper";
    };
  };

}
