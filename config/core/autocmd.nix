{ opts, helpers, ... }: {
  autoCmd = [
    {
      desc = "Highlight on yank";
      event = [ "TextYankPost" ];
      callback = helpers.mkRaw #lua
        ''
          function()
            vim.highlight.on_yank()
          end
        '';
    }
    {
      event = [ "CursorHold" ];
      desc = "lsp show diagnostics on CursorHold";
      callback = helpers.mkRaw #lua
        ''
          function()
            -- Check if the current file is a .tex file
            if vim.bo.filetype == "latex" then
              return  -- Don't run the function for .tex files
            end
            local hover_opts = {
              focusable = false,
              close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
              border = "${opts.border}",
              source = "always",
            }
            vim.diagnostic.open_float(nil, hover_opts)
          end
        '';
    }
  ];
}
