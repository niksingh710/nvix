{ icons, ... }: {
  plugins.dashboard = {
    enable = true;
    settings = {
      hide.tabline = true;
      disable_move = true;
      theme = "hyper";
      config = {
        week_header.enable = true;
        footer = [ " " " " "Don't Stop Until You are Proud" ];
        header = [
          "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
          "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
          "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
          "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
          "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
          "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
        ];
        shortcut = [
          {
            desc = "  prevSession ";
            group = "Number";
            key = ".";
            action = "SessionRestore";
          }
          {
            desc = "${icons.ui.ExitCircle} quit ";
            group = "DiagnosticError";
            key = "q";
            action = "qa";
          }
          {
            desc = "  sessions ";
            group = "DiagnosticHint";
            key = "l";
            action = "Autosession search";
          }
        ];
      };
    };
  };
}
