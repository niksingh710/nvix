{ ... }: {
  plugins.toggleterm = {
    enable = true;
     settings = {
        hide_numbers = false;
        autochdir = true;
        close_on_exit = true;
        direction = "vertical";
      };
      keymaps = [
        {
          mode = "n";
          key = "<leader>t";
          action = "<cmd>ToggleTerm<cr>";
          options = {
            desc = "Toggle Terminal Window";
          };
        }
        {
          mode = "n";
          key = "<leader>tv";
          action = "<cmd>ToggleTerm direction=vertical<cr>";
          options = {
            desc = "Toggle Vertical Terminal Window";
          };
        }
        {
          mode = "n";
          key = "<leader>th";
          action = "<cmd>ToggleTerm direction=horizontal<cr>";
          options = {
            desc = "Toggle Horizontal Terminal Window";
          };
        }
        {
          mode = "n";
          key = "<leader>tf";
          action = "<cmd>ToggleTerm direction=float<cr>";
          options = {
            desc = "Toggle Floating Terminal Window";
          };
        }
      ];
    };
}
