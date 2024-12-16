{ helpers, mkKey, ... }:
let
  inherit (mkKey) mkKeymap;
in
{
  plugins.snacks.settings.terminal.win.style.keys.term_normal = (helpers.listToUnkeyedAttrs [
    "<esc>"
    (helpers.mkRaw ''
      function(self)
        self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
        if self.esc_timer:is_active() then
         self.esc_timer:stop()
          vim.cmd("stopinsert")
        else
          self.esc_timer:start(200, 0, function() end)
          return "<esc>"
        end
      end
    '')
  ]) // {
    mode = "t";
    expr = true;
    desc = "Double escape to normal mode";
  };

  keymaps = [
    (mkKeymap "n" "<c-/>" (helpers.mkRaw ''function() Snacks.terminal() end'') "Toggle Terminal")
    (mkKeymap "t" "<c-/>" (helpers.mkRaw ''function() Snacks.terminal() end'') "Toggle Terminal")
    (mkKeymap "n" "<c-_>" (helpers.mkRaw ''function() Snacks.terminal() end'') "which_key_ignore")
    (mkKeymap "t" "<c-_>" (helpers.mkRaw ''function() Snacks.terminal() end'') "which_key_ignore")
  ];
}
