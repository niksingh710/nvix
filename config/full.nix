{ self, ... }:
{
  imports = [
    ./core.nix
    self.nvixModules.tex
  ];
}
