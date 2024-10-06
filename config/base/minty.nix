{ mkPkgs, mkKey, inputs, ... }:
let inherit (mkKey) mkKeymap;
in {

  extraPlugins = [
    (mkPkgs "volt" inputs.volt)
    (mkPkgs "minty" inputs.minty)
  ];

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
