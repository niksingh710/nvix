{ opts, ... }: {
  autoCmd = [
    {
      desc = "Highlight on yank";
      event = [ "TextYankPost" ];
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      };
    }

    {
      event = [ "CursorHold" ];
      desc = "lsp show diagnostics on CursorHold";
      callback = {
        __raw = ''
          function()
            local hover_opts = {
              focusable = false,
              close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
              border = "${opts.border}",
              source = "always",
            }
            vim.diagnostic.open_float(nil, hover_opts)
          end
        '';
      };
    }
  ];
}
