{ opts, lib, pkgs, mkKey, ... }:
let
  inherit (mkKey) mkKeymap;
in
{
  plugins = {
    otter.enable = true;
    conform-nvim = {
      enable = true;
      settings = {
        # never: never use the LSP for formatting.
        # fallback: LSP formatting is used when no other formatters are available.
        # prefer: Use only LSP formatting when available.
        # first: LSP formatting is used when available and then other formatters.
        # last: Other formatters are used then LSP formatting when available.
        # format_on_save = "function() return end";
        default_format_opts.lsp_format = "fallback";
        formatters_by_ft = {
          "_" = [
            "squeeze_blanks"
            "trim_whitespace"
            "trim_newlines"
          ];
        };
        formatters = {
          squeeze_blanks = {
            command = lib.getExe' pkgs.coreutils "cat";
          };
        };
      };
    };
    lsp = {
      enable = true;
      servers.typos-lsp.enable = true;
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
      hover.openCmd = "!firefox";
      ui.border = "${opts.border}";
      scrollPreview = {
        scrollDown = "<c-d>";
        scrollUp = "<c-u>";
      };
    };
  };

  plugins.lsp.onAttach = # lua
    ''
       -- Helper function to set key mappings more easily
       local function buf_set_keymap(mode, lhs, rhs, opts)
         opts = vim.tbl_extend("force", { noremap = true, silent = true, buffer = bufnr }, opts or {})
         vim.keymap.set(mode, lhs, rhs, opts)
       end

       buf_set_keymap("n", "<leader>ll",
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
         end, { desc = "Toggle Ghost Lsp" })

       buf_set_keymap("n", "<leader>lL",
         function()
           if vim.g.diagnostics_visible then
             vim.g.diagnostics_visible = false
             vim.diagnostic.disable()
           else
             vim.g.diagnostics_visible = true
             vim.diagnostic.enable()
           end
           end, { desc = "Toggle Diagnostics" })

       buf_set_keymap("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
       buf_set_keymap("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "Outline" })
       buf_set_keymap("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "Outline" })
       buf_set_keymap("n", "<leader>lO", "<cmd>lua require('otter').activate()<cr>", { desc = "Otter" })
       buf_set_keymap("n", "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics<cr>", { desc = "Workspace Diagnostics" })

       -- LSP key mappings
       buf_set_keymap("n", "gd", "<cmd>Lspsaga goto_defination<cr>", { desc = "Go to Definition" })
       buf_set_keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
       buf_set_keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
       buf_set_keymap("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
       buf_set_keymap("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })

       buf_set_keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
       buf_set_keymap("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
       buf_set_keymap("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help (Insert Mode)" })

       -- Code actions
       buf_set_keymap({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })

       -- Rename
       buf_set_keymap("n", "gR", "<cmd>Lspsaga rename ++project<cr>", { desc = "Rename Symbol" })
       buf_set_keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<cr>", { desc = "Type Definations" })
       buf_set_keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = "Show Line Diagnostics" })
       buf_set_keymap("n", "gpd", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek Definitions" })
       buf_set_keymap("n", "gpt", "<cmd>Lspsaga peek_type_definition<cr>", { desc = "Peek Type Definitions" })
       buf_set_keymap("n", "K",
           function()
             local winid = require("ufo").peekFoldedLinesUnderCursor()
             if not winid then
               vim.cmd("Lspsaga hover_doc")
             end
           end, { desc = "Hover Doc" })

       -- Diagnostics
       buf_set_keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
       buf_set_keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
       buf_set_keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "Jump Prev Diagnostic" })
       buf_set_keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Jump Next Diagnostic" })

       -- Formatting
       buf_set_keymap("n", "<leader>lf", function() require("conform").format() end, { desc = "Format Buffer" })
       buf_set_keymap("x", "<leader>lf", function() require("conform").format() end, { desc = "Format Buffer" })
       buf_set_keymap("v", "<leader>lf", function() require("conform").format() end, { desc = "Format Buffer" })

      -- Customize the "injected" formatter
      require("conform").formatters.injected = {
        -- Set the options field
        options = {
          -- Set individual option values
          ignore_errors = true,
          lang_to_formatters = {},
          lang_to_ext = {
            bash = "sh",
            lua = "lua",
            c_sharp = "cs",
            elixir = "exs",
            javascript = "js",
            julia = "jl",
              markdown = "md",
            latex = "tex",
            python = "py",
            ruby = "rb",
            rust = "rs",
            teal = "tl",
            typescript = "ts",
          },
        },
      }
    '';
}
