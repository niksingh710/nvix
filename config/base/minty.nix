{ mkPkgs, mkKey, inputs, ... }:
let inherit (mkKey) mkKeymap;
in {

  extraPlugins = [
    (mkPkgs "volt" inputs.volt)
    (mkPkgs "minty" inputs.minty)
  ];
  extraConfigLua = /* lua */ ''
    require('minty').setup({
      huefy = {
        mappings = function(bufs)
            local api = require("minty.shades.api")
            vim.keymap.set("n", "s", api.save_color, { buffer = buf })
          end
      };
    })
  '';

  plugins.nvim-colorizer = {
    enable = true;
    userDefaultOptions = {
      css = true;
      mode = "virtualtext";
      tailwind = true;
      sass.enable = true;
      virtualtext = "■";
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader>uc" "<cmd>lua require('minty.huefy').open()<cr>" "Color Picker (minty)")
  ];
}
