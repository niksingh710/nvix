{ pkgs, inputs, ... }:
{
  extraPlugins = [
    # (pkgs.vimUtils.buildVimPlugin {
    #   pname = "minty";
    #   src = inputs.minty;
    # })
  ];
}
