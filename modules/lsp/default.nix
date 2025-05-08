{
  lib,
  config,
  helpers,
  ...
}:
{
  plugins = {
    mini.modules.comment = {
      mappings = {
        comment = "<leader>/";
        comment_line = "<leader>/";
        comment_visual = "<leader>/";
        ignore_blank_line = true;
      };
    };
    trim.enable = true;
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        harper_ls.enable = true; # Alternative for grammerly
        typos_lsp = {
          enable = true;
          extraOptions.init_options.diagnosticSeverity = "Hint";
        };
      };
      keymaps = {
        silent = true;
        diagnostic = {
          "<leader>lj" = "goto_next";
          "<leader>lk" = "goto_prev";
        };
      };
    };
  };

  diagnostic.settings = {
    virtual_text = false;
    underline = true;
    signs = true;
    severity_sort = true;
    float = {
      border = config.nvix.border;
      source = "always";
      focusable = false;
    };
  };
  autoCmd = [
    {
      event = [ "CursorHold" ];
      desc = "lsp show diagnostics on CursorHold";
      callback =
        helpers.mkRaw # lua

          ''
            function()
             local hover_opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = "${config.nvix.border}",
                source = "always",
              }
              vim.diagnostic.open_float(nil, hover_opts)
            end
          '';
    }
  ];

  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}")) (attrNames (readDir ./.))
    );
}
