{ opts, mkKey, icons, ... }:
let inherit (mkKey) mkKeymap;
in {
  plugins = {
    lsp = {
      enable = true;
      keymaps = {
        silent = true;
        lspBuf = {
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
        diagnostic = {
          gj = "goto_next";
          gk = "goto_prev";
        };
      };
    };
    lspsaga = {
      enable = true;
      lightbulb = {
        enable = false;
        virtualText = false;
      };
      outline.keys.jump = "<cr>";
      hover = { openCmd = "!firefox"; };
      ui.border = "${opts.border}";
      scrollPreview = {
        scrollDown = "<c-d>";
        scrollUp = "<c-u>";
      };
    };
  };

  extraConfigLua = # lua
    ''

      local signs = {
          Hint = "${icons.diagnostics.BoldHint}",
          Info = "${icons.diagnostics.BoldInformation}",
          Warn = "${icons.diagnostics.BoldWarning}",
          Error = "${icons.diagnostics.BoldError}",
        }

        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

      vim.diagnostic.config({
        virtual_text = false,
        underline = true,
        signs = true,
        severity_sort = true,
        float = {
          border = "${opts.border}",
          source = "always",
          focusable = false,
        },
      })

    '';

  keymaps = [

    (mkKeymap "v" "<leader>lf" {
      __raw = ''
        function() local cok, conform = pcall(require, "conform") if cok then return conform.format() else return vim.lsp.buf.format() end end'';
    } "Format file")
    (mkKeymap "x" "<leader>lf" {
      __raw = ''
        function() local cok, conform = pcall(require, "conform") if cok then return conform.format() else return vim.lsp.buf.format() end end'';
    } "Format file")

    (mkKeymap "n" "<leader>lf" {
      __raw = ''
        function() local cok, conform = pcall(require, "conform") if cok then return conform.format() else return vim.lsp.buf.format() end end'';
    } "Format file")
    (mkKeymap "n" "<leader>li" "<cmd>LspInfo<cr>" "LspInfo")
    (mkKeymap "n" "<leader>lo" "<cmd>Lspsaga outline <cr>" "Outline")
    (mkKeymap "n" "<leader>lw" "<cmd>Lspsaga show_workspace_diagnostics<cr>"
      "Workspace Diagnostics")
    (mkKeymap "n" "<leader>ld" "<cmd>Lspsaga show_buf_diagnostics<cr>"
      "Line Diagnostics")
    (mkKeymap "n" "<leader>la" "<cmd>Lspsaga code_action<cr>" "Code Action")

    (mkKeymap "n" "<leader>lk" "<cmd>lua vim.diagnostic.goto_prev()<cr>"
      "Next Diagnostic")
    (mkKeymap "n" "<leader>lj" "<cmd>lua vim.diagnostic.goto_next()<cr>"
      "Prev Diagnostic")

    (mkKeymap "n" "<leader>ll" {
      __raw = ''
        function()
          if vim.diagnostic.config().virtual_text == false then
            vim.diagnostic.config({
              virtual_text = {
                source = "always",
                prefix = "●",
              },
            })
          else
            vim.diagnostic.config({
              virtual_text = false,
            })
          end
        end '';
    } "Toggle Ghost Text")
    (mkKeymap "n" "<leader>lL" {
      __raw = ''
        function()
          if vim.g.diagnostics_visible then
            vim.g.diagnostics_visible = false
            vim.diagnostic.disable()
          else
            vim.g.diagnostics_visible = true
            vim.diagnostic.enable()
          end
          end '';
    } "Toggle Diagnostics")

    (mkKeymap "n" "]e" "<cmd>Lspsaga diagnostic_jump_next<CR>"
      "Next Diagnostic")
    (mkKeymap "n" "[e" "<cmd>Lspsaga diagnostic_jump_prev<CR>"
      "Previous Diagnostic")
    (mkKeymap "n" "[E"
      "<cmd>lua require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>"
      "Previous Error")
    (mkKeymap "n" "]E"
      "<cmd>lua require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>"
      "Next Error")
    (mkKeymap "n" "gd" "<cmd>Lspsaga goto_definition<CR>" "Goto Definations")
    (mkKeymap "n" "gh" "<cmd>Lspsaga lsp_finder<CR>" "LSP Finder")
    (mkKeymap "n" "gR" "<cmd>Lspsaga rename ++project<CR>" "Rename")
    (mkKeymap "n" "gt" "<cmd>Lspsaga goto_type_definition<CR>"
      "Type Definations")
    (mkKeymap "n" "gl" "<cmd>Lspsaga show_line_diagnostics<CR>"
      "Line Diagnostics")
    (mkKeymap "n" "gpd" "<cmd>Lspsaga peek_definition<CR>" "Peek Definations")
    (mkKeymap "n" "gpt" "<cmd>Lspsaga peek_type_definition<CR>"
      "Peek Type Definations")
    (mkKeymap "n" "K" {
      __raw = # lua
        ''
          function()
            local uok, ufo = pcall (require, "ufo")
              if uok then
              local winid = ufo.peekFoldedLinesUnderCursor()
              if not winid then
                -- choose one of coc.nvim and nvim lsp
                -- vim.lsp.buf.hover()
                vim.cmd("Lspsaga hover_doc")
              end
            else
              vim.cmd("Lspsaga hover_doc")
            end
          end
        '';
    } "Hover Doc")
  ];
}
