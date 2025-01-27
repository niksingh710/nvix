{ config, ... }:
{
  plugins.lspsaga = {
    enable = true;
    lightbulb = {
      enable = false;
      virtualText = false;
    };
    outline.keys.jump = "<cr>";
    ui.border = config.nvix.border;
    scrollPreview = {
      scrollDown = "<c-d>";
      scrollUp = "<c-u>";
    };
  };
}
