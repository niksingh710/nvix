{
  plugins.which-key = {
    enable = true;
    hidden = [
      "<silent>"
      "<cmd>"
      "<Cmd>"
      "<CR>"
      "^:"
      "^ "
      "^call "
      "^lua "
    ];
  };
  opts = {
    timeout = true;
    timeoutlen = 300;
  };
}
