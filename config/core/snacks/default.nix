{ mkKey, helpers, ... }:
let
  inherit (mkKey) mkKeymap;
in
{
  imports = with builtins;
    map (fn: ./${fn})
      (filter (fn: fn != "default.nix") (attrNames (readDir ./.)));

  plugins.snacks = {
    enable = true;
    settings = {

      # TODO: Switch it on after removing the indent from treesitter.nix same for zen and zoom
      # After snacks update to 15th Dec https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/applications/editors/vim/plugins/generated.nix#L11392
      zen.enabled = false;
      zoom.enabled = false;
      indent.enabled = false;
      animate.enabled = true;
      notifier.enabled = true;
      quickfile.enabled = true;
      bigfile.enabled = true;
      scroll.enabled = true;
      statuscolumn = {
        enabled = true;
        folds = {
          open = true;
          git_hl = true;
        };
      };
      words = {
        debounce = 100;
        enabled = true;
      };
    };
  };


  keymaps = [
    # NOTE: See Todo above
    # (mkKeymap "n" "<leader>z" (helpers.mkRaw ''function() Snacks.zen() end'') "Toggle Zen Mode")
    # (mkKeymap "n" "<leader>Z" (helpers.mkRaw ''function() Snacks.zen.zoom() end'') "Toggle Zoom")
    (mkKeymap "n" "<leader>un" (helpers.mkRaw ''function() Snacks.notifier.hide() end'') "Dismiss All Notifications")

    (mkKeymap "n" "<leader>." (helpers.mkRaw ''function() Snacks.scratch() end'') "Toggle Scratch Buffer")
    (mkKeymap "n" "<leader>S" (helpers.mkRaw ''function() Snacks.scratch.select() end'') "Select Scratch Buffer")
    (mkKeymap "n" "<leader>n" (helpers.mkRaw ''function() Snacks.notifier.show_history() end'') "Notification History")
    (mkKeymap "n" "<leader>cR" (helpers.mkRaw ''function() Snacks.rename.rename_file() end'') "Rename File")
    (mkKeymap "n" "<leader>gB" (helpers.mkRaw ''function() Snacks.gitbrowse() end'') "Git Browse")
    (mkKeymap "n" "<leader>gf" (helpers.mkRaw ''function() Snacks.lazygit.log_file() end'') "Lazygit Current File History")
    (mkKeymap "n" "<leader>gg" (helpers.mkRaw ''function() Snacks.lazygit() end'') "Lazygit")
    (mkKeymap "n" "<leader>gl" (helpers.mkRaw ''function() Snacks.lazygit.log() end'') "Lazygit Log (cwd)")
    (mkKeymap "n" "<leader>un" (helpers.mkRaw ''function() Snacks.notifier.hide() end'') "Dismiss All Notifications")
  ];

  autoCmd = [
    {
      desc = "Pre init Function";
      event = [ "VimEnter" ];
      callback = helpers.mkRaw #lua
        ''
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
            Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
            Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
            Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
            Snacks.toggle.diagnostics():map("<leader>ud")
            Snacks.toggle.line_number():map("<leader>ul")
            Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
            Snacks.toggle.treesitter():map("<leader>uT")
            Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
            Snacks.toggle.inlay_hints():map("<leader>uh")
          end
        '';
    }
  ];


}
