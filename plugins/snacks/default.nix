{ lib, pkgs, ... }:
let
  inherit (lib.nixvim) mkRaw utils;
  reopenFn = # lua
    ''
      local reopen_picker = function(source, picker)
        picker:close()
        Snacks.picker.pick(
          source,
          vim.tbl_extend('force', picker.init_opts, {
            search = picker:filter().search,
            pattern = picker:filter().pattern,
            live = picker.opts.live,
            ignored = picker.opts.ignored,
            hidden = picker.opts.hidden,
          } --[[@as snacks.picker.Config]])
        )
      end
    '';
in
{
  # Generalise for all colorschemes
  # <https://github.com/folke/snacks.nvim/discussions/1306#discussioncomment-12266647>
  plugins.todo-comments.enable = true;
  plugins.neoscroll.enable = true;
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = true;
      scroll.enabled = false;
      quickfile.enabled = true;
      indent.enabled = true;
      words.enabled = true;
      statuscolumn.enabled = true;
      dashboard.enabled = lib.mkDefault false;
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
          };
        in
        {
          enabled = true;
          sources = {
            files = {
              # FIXME: Test if this works when switching from files to grep
              actions.switch_grep =
                (mkRaw # lua
                  ''
                    function(picker)
                      ${reopenFn}
                      reopen_picker('grep', picker)
                    end,
                  '');
              win.input.keys = {
                "g" = (utils.listToUnkeyedAttrs [ "switch_grep" ]) // {
                  mode = "n";
                };
              };
            };
            grep = {
              actions.switch_files =
                (mkRaw # lua
                  ''
                    function(picker)
                      ${reopenFn}
                      reopen_picker('files', picker)
                    end,
                  '');
              win.input.keys = {
                "f" = (utils.listToUnkeyedAttrs [ "switch_files" ]) // {
                  mode = "n";
                };
              };
            };
          };
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

  extraPackages = with pkgs;[
    imagemagick
    ghostscript_headless
    tectonic
    mermaid-cli
  ]; # for image support

  autoCmd = [
    {
      desc = "Pre init Function";
      event = [ "VimEnter" ];
      callback =
        utils.mkRaw # lua
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
