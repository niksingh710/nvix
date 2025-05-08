{ helpers, lib, ... }:
{
  # Generalise for all colorschemes
  # <https://github.com/folke/snacks.nvim/discussions/1306#discussioncomment-12266647>
  plugins.todo-comments.enable = true;
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = true;
      scroll.enabled = false; # if i ever find soln for <https://github.com/folke/snacks.nvim/issues/1360>
      quickfile.enabled = true;
      indent.enabled = true;
      words.enabled = true;
      picker =
        let
          keys = {
            "<c-d>" = (helpers.listToUnkeyedAttrs [ "preview_scroll_down" ]) // {
              mode = "n";
            };
            "<c-u>" = (helpers.listToUnkeyedAttrs [ "preview_scroll_up" ]) // {
              mode = "n";
            };
          };
        in
        {
          enabled = true;
          win = {
            input.keys = keys;
            list.keys = keys;
          };
          layouts = {
            sexy.layout = (
              helpers.listToUnkeyedAttrs [
                {
                  win = "input";
                  height = 1;
                  border = "single";
                  title = "Find {title} {live} {flags}";
                  title_pos = "center";
                }
                (
                  helpers.listToUnkeyedAttrs [
                    {
                      win = "list";
                      border = [
                        "🭽"
                        "▔"
                        "🭾"
                        "▕"
                        "🭿"
                        "▁"
                        "🭼"
                        "▏"
                      ];
                    }
                    {
                      win = "preview";
                      border = [
                        "🭽"
                        "▔"
                        "🭾"
                        "▕"
                        "🭿"
                        "▁"
                        "🭼"
                        "▏"
                      ];
                      width = 0.6;
                    }
                  ]
                  // {
                    box = "horizontal";
                  }
                )
              ]
              // {
                box = "vertical";
                width = 0.9;
                height = 0.9;
                border = "none";
              }
            );
          };
          sources.explorer = {
            actions.toggle_preview =
              helpers.mkRaw # lua
                ''
                  function(picker) --[[Override]]
                    picker.preview.win:toggle()
                  end
                '';
            layout.layout = (
              helpers.listToUnkeyedAttrs [
                {
                  win = "input";
                  height = 1;
                  border = "rounded";
                  title = "{title} {live} {flags}";
                  title_pos = "center";
                }
                {
                  win = "list";
                  border = "none";
                }
              ]
              // {
                backdrop = false;
                width = 40;
                min_width = 40;
                height = 0;
                position = "left";
                border = "none";
                box = "vertical";
              }
            );
            on_show =
              helpers.mkRaw # lua
                ''
                  function(picker)
                    local show = false
                    local gap = 1
                    local min_width, max_width = 20, 100
                    --
                    local rel = picker.layout.root
                    local update = function(win) ---@param win snacks.win
                      win.opts.row = vim.api.nvim_win_get_position(rel.win)[1]
                      win.opts.col = vim.api.nvim_win_get_width(rel.win) + gap
                      win.opts.height = 0.8
                      local border = win:border_size().left + win:border_size().right
                      win.opts.width = math.max(min_width, math.min(max_width, vim.o.columns - border - win.opts.col))
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
                    rel:on('WinResized', function()
                      update(preview_win)
                    end)
                    picker.preview.win = preview_win
                    picker.main = preview_win.win
                  end
                '';
            on_close =
              helpers.mkRaw # lua
                ''
                  function(picker)
                    picker.preview.win:close()
                  end
                '';
          };
          layout.preset = "sexy";
        };
      image = {
        enabled = true;
        border = "none";
        doc.inline = false;
      };
      notifier = {
        enabled = true;
        style = "minimal";
        top_down = false;
      };
    };
  };

  autoCmd = [
    {
      desc = "Pre init Function";
      event = [ "VimEnter" ];
      callback =
        helpers.mkRaw # lua
          ''
            -- Taken from https://github.com/folke/snacks.nvim?tab=readme-ov-file#-usage
            function()
              -- Setup some globals for debugging (lazy-loaded)
              _G.dd = function(...)
                Snacks.debug.inspect(...)
              end
              _G.bt = function()
                Snacks.debug.backtrace()
              end
              vim.print = _G.dd -- Override print to use snacks for `:=` command

              -- Create some toggle mappings
              Snacks.toggle.diagnostics():map("<leader>ud")
              Snacks.toggle.line_number():map("<leader>ul")
              Snacks.toggle.inlay_hints():map("<leader>uh")
              Snacks.toggle.treesitter():map("<leader>uT")
              Snacks.toggle.option("spell",
                { name = "Spelling" }):map("<leader>us")
              Snacks.toggle.option("wrap",
                { name = "Wrap" }):map("<leader>uw")
              Snacks.toggle.option("relativenumber",
                { name = "Relative Number" }):map("<leader>uL")
              Snacks.toggle.option("conceallevel",
                { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
              Snacks.toggle.option("background",
                { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
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
