{pkgs,mkKey,...}:
let
  inherit (mkKey) mkKeymap;
in {
  plugins.noice = {
    enable = true;
    lsp = {
      override = {
        "vim.lsp.util.convert_input_to_markdown_lines" = true;
        "vim.lsp.util.stylize_markdown" = true;
        "cmp.entry.get_documentation" = true;
      };
      hover.enabled = false;
      message.enabled = false;
      signature.enabled = false;
      progress.enabled = false;
    };
    presets = {
      bottom_search = true;
      command_palette = true;
      long_message_to_split = true;
      inc_rename = false;
      lsp_doc_border = false;
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>un" { __raw = "function () require('notify').dismiss() end"; } "Dismiss notification")
  ];
  extraPlugins = with pkgs.vimPlugins; [
    nvim-notify
  ];
  extraConfigLua = ''
    require('notify').setup({
      split = true,
      background_colour = "#000000",
      render = "compact",
      stages = "fade_in_slide_out",
      top_down = false,
    })
  '';
}
