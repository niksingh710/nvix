{ pkgs, ... }:
{
  plugins.leetcode = {
    enable = true;
    settings.lang = "python3";
    package = pkgs.vimPlugins.leetcode-nvim.overrideAttrs (oa: {
      src = pkgs.fetchFromGitHub {
        owner = "niksingh710";
        repo = "leetcode.nvim";
        rev = "cab77da208b0abca7070ef4213bc4cea1a339ada";
        hash = "sha256-Uf+66Z+S0o0G+JZR++mAhKX+gTN9NJY0WkVr0dfRlWw=";
      };
    });
  };
}
