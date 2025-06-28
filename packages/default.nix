{ flake, inputs', self', ... }:
let
  mkNixvim = module: inputs'.nixvim.legacyPackages.makeNixvimWithModule {
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
    # Git and version control
    self.nvixPlugins.git

    # UI and appearance
    self.nvixPlugins.lualine
    self.nvixPlugins.neo-tree
    self.nvixPlugins.firenvim

    # Code editing and syntax
    self.nvixPlugins.treesitter
    self.nvixPlugins.blink-cmp
    self.nvixPlugins.lang
    self.nvixPlugins.lsp

    # Productivity
    self.nvixPlugins.autosession
    self.nvixPlugins.copilot

    # Dashboard (Auto session works so rarely i see this.)
    self.nvixPlugins.dashboard
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

# TODO: Plugins -- config to be added
# - [ ] obsidian nvim
# - [ ] quickfix list addition in lsp
