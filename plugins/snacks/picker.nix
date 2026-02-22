{ lib, config, ... }:
let
  inherit (lib.nixvim) utils mkRaw;
  inherit (config.nvix.mkKey) mkKeymap;
in
{
  plugins.snacks.settings.picker =
    let
      keys = {
        "<c-d>" = (utils.listToUnkeyedAttrs [ "preview_scroll_down" ]) // {
          mode = "n";
        };
        "<c-u>" = (utils.listToUnkeyedAttrs [ "preview_scroll_up" ]) // {
          mode = "n";
        };
        "-" = (utils.listToUnkeyedAttrs [ "edit_split" ]) // {
          mode = "n";
        };
        "|" = (utils.listToUnkeyedAttrs [ "edit_vsplit" ]) // {
          mode = "n";
        };
      };
    in
    {
      enabled = true;
      actions.pick_win = mkRaw ''
        function(picker)
          if not picker.layout.split then
            picker.layout:hide()
          end
          local win = Snacks.picker.util.pick_win {
            main = picker.main,
            float = false,
            filter = function(_, buf)
              local ft = vim.bo[buf].ft
              return ft == 'snacks_dashboard' or not ft:find '^snacks'
            end,
          }
          if not win then
            if not picker.layout.split then
              picker.layout:unhide()
            end
            return true
          end
          picker.main = win
          if not picker.layout.split then
            vim.defer_fn(function()
              if not picker.closed then
                picker.layout:unhide()
              end
            end, 100)
          end
        end
      '';
      sources.explorer =
        # lua
        mkRaw ''
          {
            on_show = function(picker)
              local show = false
              local gap = 1
              local clamp_width = function(value)
                return math.max(20, math.min(100, value))
              end
              --
              local position = picker.resolved_layout.layout.position
              local rel = picker.layout.root
              local update = function(win) ---@param win snacks.win
                local border = win:border_size().left + win:border_size().right
                win.opts.row = vim.api.nvim_win_get_position(rel.win)[1]
                win.opts.height = 0.8
                if position == 'left' then
                  win.opts.col = vim.api.nvim_win_get_width(rel.win) + gap
                  win.opts.width = clamp_width(vim.o.columns - border - win.opts.col)
                end
                if position == 'right' then
                  win.opts.col = -vim.api.nvim_win_get_width(rel.win) - gap
                  win.opts.width = clamp_width(vim.o.columns - border + win.opts.col)
                end
                win:update()
              end
              local preview_win = Snacks.win.new {
                relative = 'editor',
                external = false,
                focusable = false,
                border = 'rounded',
                backdrop = false,
                show = show,
                bo = {
                  filetype = 'snacks_float_preview',
                  buftype = 'nofile',
                  buflisted = false,
                  swapfile = false,
                  undofile = false,
                },
                on_win = function(win)
                  update(win)
                  picker:show_preview()
                end,
              }
              rel:on('WinLeave', function()
                vim.schedule(function()
                  if not picker:is_focused() then
                    picker.preview.win:close()
                  end
                end)
              end)
              rel:on('WinResized', function()
                update(preview_win)
              end)
              picker.preview.win = preview_win
              picker.main = preview_win.win
            end,
            on_close = function(picker)
              picker.preview.win:close()
            end,
            layout = {
              preset = 'sidebar',
              layout = {
                backdrop = false,
                width = 40, -- Pfff.. 40. I have 60!
                min_width = 40,
                height = 0,
                position = 'right',
                border = 'none',
                box = 'vertical',
                { win = 'list', border = 'none' },
                { win = 'preview', title = '{preview}', height = 0.4, border = 'top' },
              },
              preview = false, ---@diagnostic disable-line
            },
            actions = {
              toggle_preview = function(picker) --[[Override]]
                picker.preview.win:toggle()
              end,
            },
          }
        '';
      win = {
        input.keys = keys;
        list.keys = keys // {
          "<Enter>" =
            # lua
            mkRaw ''
              { { "pick_win", "jump" }, mode = { "n", "i" } }
            '';
        };
      };
    };

  keymaps = [
    (mkKeymap "n" "<leader>sb" "<cmd>:lua Snacks.picker.lines() <cr>" "Buffer Lines")
    (mkKeymap "n" "<leader>sB" "<cmd>:lua Snacks.picker.grep_buffers() <cr>" "Grep Open Buffers")
    (mkKeymap "n" "<leader>sg" "<cmd>:lua Snacks.picker.grep() <cr>" "Grep")
    (mkKeymap "n" "<leader>sw" "<cmd>:lua Snacks.picker.grep_word() <cr>" "Visual selection or word")
    (mkKeymap "x" "<leader>sw" "<cmd>:lua Snacks.picker.grep_word() <cr>" "Visual selection or word")
    (mkKeymap "n" ''<leader>s"'' "<cmd>:lua Snacks.picker.registers() <cr>" "Registers")
    (mkKeymap "n" "<leader>sa" "<cmd>:lua Snacks.picker.autocmds() <cr>" "Autocmds")
    (mkKeymap "n" "<leader>sb" "<cmd>:lua Snacks.picker.lines() <cr>" "Buffer Lines")
    (mkKeymap "n" "<leader>sc" "<cmd>:lua Snacks.picker.command_history() <cr>" "Command History")
    (mkKeymap "n" "<leader>sC" "<cmd>:lua Snacks.picker.commands() <cr>" "Commands")
    (mkKeymap "n" "<leader>sd" "<cmd>:lua Snacks.picker.diagnostics() <cr>" "Diagnostics")
    (mkKeymap "n" "<leader>sD" "<cmd>:lua Snacks.picker.diagnostics_buffer() <cr>" "Buffer Diagnostics")
    (mkKeymap "n" "<leader>sH" "<cmd>:lua Snacks.picker.highlights() <cr>" "Highlights")
    (mkKeymap "n" "<leader>si" "<cmd>:lua Snacks.picker.icons() <cr>" "Icons")
    (mkKeymap "n" "<leader>sj" "<cmd>:lua Snacks.picker.jumps() <cr>" "Jumps")
    (mkKeymap "n" "<leader>sl" "<cmd>:lua Snacks.picker.loclist() <cr>" "Location List")
    (mkKeymap "n" "<leader>sm" "<cmd>:lua Snacks.picker.marks() <cr>" "Marks")
    (mkKeymap "n" "<leader>sM" "<cmd>:lua Snacks.picker.man() <cr>" "Man Pages")
    (mkKeymap "n" "<leader>sq" "<cmd>:lua Snacks.picker.qflist() <cr>" "Quickfix List")
    (mkKeymap "n" "<leader>sR" "<cmd>:lua Snacks.picker.resume() <cr>" "Resume")
    (mkKeymap "n" "<leader>su" "<cmd>:lua Snacks.picker.undo() <cr>" "Undo History")

    (mkKeymap "n" "gd" "<cmd>:lua Snacks.picker.lsp_definitions() <cr>" "Goto Definition")
    (mkKeymap "n" "gD" "<cmd>:lua Snacks.picker.lsp_declarations() <cr>" "Goto Declaration")
    (mkKeymap "n" "gr" "<cmd>:lua Snacks.picker.lsp_references() <cr>" "References")
    (mkKeymap "n" "gI" "<cmd>:lua Snacks.picker.lsp_implementations() <cr>" "Goto Implementation")
    (mkKeymap "n" "gy" "<cmd>:lua Snacks.picker.lsp_type_definitions() <cr>" "Goto T[y]pe Definition")
    (mkKeymap "n" "<leader>ss" "<cmd>:lua Snacks.picker.lsp_symbols() <cr>" "LSP Symbols")
    (mkKeymap "n" "<leader>sS" "<cmd>:lua Snacks.picker.lsp_workspace_symbols() <cr>"
      "LSP Workspace Symbols"
    )

    # Telescope replacement
    (mkKeymap "n" "<leader>sP" "<cmd>:lua Snacks.picker()<cr>" "Pickers")
    (mkKeymap "n" "<leader>ss" "<cmd>:lua Snacks.picker.smart()<cr>" "Smart")
    (mkKeymap "n" "<leader>st" "<cmd>:lua Snacks.picker.todo_comments({layout = 'ivy'})<cr>" "Todo")
    (mkKeymap "n" "<leader>sT"
      ''<cmd>:lua Snacks.picker.todo_comments({keywords = {"TODO", "FIX", "FIXME"}, layout = 'ivy'})<cr>''
      "Todo"
    )
    (mkKeymap "n" "<leader>s:" "<cmd>:lua Snacks.picker.command_history({ layout = 'ivy'})<cr>"
      "Command History"
    )
    (mkKeymap "n" "<leader>s," "<cmd>:lua Snacks.picker.buffers({layout = 'ivy'})<cr>" "Buffers")
    (mkKeymap "n" "<leader>sh" "<cmd>:lua Snacks.picker.help()<cr>" "Help Pages")
    (mkKeymap "n" "<leader>sk" "<cmd>:lua Snacks.picker.keymaps({layout = 'vscode'})<cr>" "Keymaps")

    (mkKeymap "n" "<leader>su" (
      # lua
      mkRaw ''
        function()
          Snacks.picker.undo({
            win = {
              input = {
                keys = {
                  ["y"] = { "yank_add", mode =  "n" },
                  ["Y"] = { "yank_del", mode =  "n" },
                },
              },
            },
          })
        end
      ''
    ) "Undo")

    (mkKeymap "n" "<leader>ff" "<cmd>:lua Snacks.picker.files()<cr>" "Find Files")
    (mkKeymap "n" "<leader>fF" "<cmd>:lua Snacks.picker.smart()<cr>" "Smart")
    (mkKeymap "n" "<leader>f/" "<cmd>:lua Snacks.picker.grep()<cr>" "Grep")
    (mkKeymap "n" "<leader>f?"
      "<cmd>:lua Snacks.picker.grep({layout = 'ivy', args = { '--vimgrep', '--smart-case', '--fixed-strings' } })<cr>"
      "Grep"
    )
    (mkKeymap "n" "<leader>fr" "<cmd>:lua Snacks.picker.recent()<cr>" "Recent")
    (mkKeymap "n" "<leader>fp" "<cmd>:lua Snacks.picker.projects()<cr>" "Projects")
  ];
}
