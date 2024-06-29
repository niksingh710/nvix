{
  plugins.image = {
    # TODO: fix ueberzug issue on tmux layout change
    enable = false;
    backend = "ueberzug";
    editorOnlyRenderWhenFocused = true;
    maxWidth = 50;
    maxHeight = 50;
    integrations.markdown.onlyRenderImageAtCursor = true;
  };
}
