{ lib, config, ... }:
let
  inherit (config.nvix.mkKey) mkKeymap;
in
{

  opts = {
    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;
  };
  plugins = {
    otter = {
      enable = false;
      settings.buffers = {
        set_filetype = true;
      };
    };
    # TODO: Add mappings in parallel with quickfix
    trouble.enable = true;
    tiny-inline-diagnostic.enable = true;
    lsp = {
      keymaps.extra = [
        (mkKeymap "n" "<leader>lO" "<cmd>lua require('otter').activate()<cr>" "Force Otter")
      ];
      enable = true;
      inlayHints = true;
      servers = {
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
    lspsaga = {
      enable = true;
      settings = {
        lightbulb = {
          enable = false;
          virtualText = false;
        };
        outline.keys.jump = "<cr>";
        ui.border = config.nvix.border;
        scrollPreview = {
          scrollDown = "<c-d>";
          scrollUp = "<c-u>";
        };
      };
    };
    nvim-ufo = {
      enable = true;
      settings = {
        provider_selector = # lua
          ''
            function()
              return { "lsp", "indent" }
            end
          '';
        preview.mappings = {
          close = "q";
          switch = "K";
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

  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}")) (attrNames (readDir ./.))
    );
}
