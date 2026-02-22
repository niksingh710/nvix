{ lib, config, ... }:
let
  inherit (lib.nixvim) mkRaw;
  inherit (config.nvix.mkKey) mkKeymap;
in
{
  plugins.snacks.settings.picker.sources.explorer =
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

  keymaps = [
    (mkKeymap "n" "<leader>e" "<cmd>:lua Snacks.explorer()<cr>" "Explorer")
  ];
}
