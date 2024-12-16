{ pkgs, inputs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "typr";
      src = inputs.typr;
    })
  ];
}
