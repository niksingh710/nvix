{ pkgs, inputs, mkKey, ... }:
let inherit (mkKey) mkKeymap;
in {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "Nvim Session Manager";
      src = inputs.session-manager;
    })
  ];
  extraConfigLua = # lua
    ''
      local config = require('session_manager.config')
      require("session_manager").setup({
        autoload_mode = config.AutoloadMode.Disabled,
        })
    '';
  keymaps = [
    (mkKeymap "n" "<leader>S." "<cmd>SessionManager load_last_session<CR>"
      "Last Session")
    (mkKeymap "n" "<leader>Sl" "<cmd>SessionManager load_session<CR>"
      "List Session")
    (mkKeymap "n" "<leader>Sd"
      "<cmd>SessionManager load_current_dir_session<CR>" "Curr Dir load")
    (mkKeymap "n" "<leader>Ss" "<cmd>SessionManager save_current_session<CR>"
      "Save Session")
    (mkKeymap "n" "<leader>SD" "<cmd>SessionManager delete_session<CR>"
      "Delete sessions")
  ];
}
