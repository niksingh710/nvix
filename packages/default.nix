{
  flake,
  inputs',
  self',
  ...
}:
let
  mkNixvim =
    module:
    inputs'.nixvim.legacyPackages.makeNixvimWithModule {
      extraSpecialArgs = { inherit inputs self; };
      inherit module;
    };
  inherit (flake) inputs self;
  bareModules = [
    # Core functionality and improvements
    self.nvixPlugins.common
    self.nvixPlugins.buffer
    self.nvixPlugins.ux # better user experience
    self.nvixPlugins.snacks
  ];
  coreModules = bareModules ++ [
    # noice for cmdline
    self.nvixPlugins.noice

    # Git and version control
    self.nvixPlugins.git

    # UI and appearance
    self.nvixPlugins.lualine
    self.nvixPlugins.firenvim

    # Code editing and syntax
    self.nvixPlugins.treesitter
    self.nvixPlugins.blink-cmp
    self.nvixPlugins.lang
    self.nvixPlugins.lsp

    # Productivity
    self.nvixPlugins.autosession
    self.nvixPlugins.ai
  ];
  fullModules = coreModules ++ [
    self.nvixPlugins.tex
  ];
in
{
  packages = {
    default = self'.packages.core;
    bare = mkNixvim bareModules;
    core = mkNixvim coreModules;
    full = mkNixvim fullModules;
  };
}
