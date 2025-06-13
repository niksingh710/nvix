{ self, ... }:
{
  imports = [
    ./bare.nix
    self.nvixModules.git
    self.nvixModules.lsp # Initializes LSP
    self.nvixModules.cmp # Initializes LSP
    self.nvixModules.lang # Language specific configurations
    # self.nvixModules.copilot
    self.nvixModules.lualine
    self.nvixModules.firenvim
    self.nvixModules.dashboard
    self.nvixModules.aesthetics
    self.nvixModules.treesitter
    self.nvixModules.colorschemes
    self.nvixModules.auto-session
    self.nvixModules.toggleterm
  ];
}
