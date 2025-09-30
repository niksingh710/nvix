{ lib, pkgs, ... }:
let
  inherit (lib.nixvim) utils mkRaw;
in
{
  # Generalise for all colorschemes
  # <https://github.com/folke/snacks.nvim/discussions/1306#discussioncomment-12266647>

  # TODO: <https://github.com/folke/snacks.nvim/discussions/2003#discussioncomment-13653042>
  # Implement this with a fix, i have done the implementation in nix way, but `grep` seems to break.
  # first check is required if it is from lua or nix
  plugins.todo-comments.enable = true;
  plugins.neoscroll.enable = true;
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = true;
      scroll.enabled = false;
      lazygit.config.os.edit =
        # lua
        mkRaw ''
          '[ -z "\"$NVIM\"" ] && (nvim -- {{filename}}) || (nvim --server "\"$NVIM\"" --remote-send "\"q\"" && nvim --server "\"$NVIM\"" --remote {{filename}})'
        '';
      quickfile.enabled = true;
      indent.enabled = true;
      words.enabled = true;
      statuscolumn.enabled = true;
      dashboard = {
        enabled = true;
        sections =
          # lua
          mkRaw ''
            {
              { section = "header" },
              {
                pane = 2,
                section = "terminal",
                cmd = "colorscript -e square",
                height = 5,
                padding = 1,
              },
              { section = "keys", gap = 1, padding = 1 },
              {
                pane = 2,
                icon = " ",
                desc = "Browse Repo",
                padding = 1,
                key = "b",
                action = function()
                  Snacks.gitbrowse()
                end,
              },
              function()
                local in_git = Snacks.git.get_root() ~= nil
                local cmds = {
                  {
                    title = "Notifications",
                    cmd = "gh notify -s -a -n5",
                    action = function()
                      vim.ui.open("https://github.com/notifications")
                    end,
                    key = "n",
                    icon = " ",
                    height = 5,
                    enabled = true,
                  },
                  {
                    title = "Open Issues",
                    cmd = "gh issue list -L 3",
                    key = "i",
                    action = function()
                      vim.fn.jobstart("gh issue list --web", { detach = true })
                    end,
                    icon = " ",
                    height = 7,
                  },
                  {
                    icon = " ",
                    title = "Open PRs",
                    cmd = "gh pr list -L 3",
                    key = "P",
                    action = function()
                      vim.fn.jobstart("gh pr list --web", { detach = true })
                    end,
                    height = 7,
                  },
                  {
                    icon = " ",
                    title = "Git Status",
                    cmd = "git --no-pager diff --stat -B -M -C",
                    height = 10,
                  },
                }
                return vim.tbl_map(function(cmd)
                  return vim.tbl_extend("force", {
                    pane = 2,
                    section = "terminal",
                    enabled = in_git,
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 3,
                  }, cmd)
                end, cmds)
              end,
              -- { section = "startup" },
            }
          '';
      };
      picker =
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
            "<cr>" =
              # lua
              mkRaw ''
                { { "pick_win", "jump" } }
              '';
          };
        in
        {
          enabled = true;
          actions.pick_win =
            # lua FIXME: on non overridden theme the picker window opens buffer with bg
            mkRaw ''
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
            list.keys = keys;
          };
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

  extraPackages = with pkgs; [
    imagemagick
    ghostscript_headless
    tectonic
    mermaid-cli
    dwt1-shell-color-scripts
  ]; # for image support

  autoCmd = [
    {
      desc = "Pre init Function";
      event = [ "VimEnter" ];
      callback =
        # lua
        mkRaw ''
          -- Taken from https://github.com/folke/snacks.nvim?tab=readme-ov-file#-usage
          function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function (...)
            Snacks.debug.inspect
            (...)
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
