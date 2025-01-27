# CMP Module 📝

The CMP module enhances the completion experience in Neovim using the powerful `nvim-cmp` plugin. This setup comes preconfigured with essential sources and features, making it ready to use out of the box.

---

## Plugins Included

| Plugin Name | Description                                               | Repository Link                                                 |
|-------------|-----------------------------------------------------------|-----------------------------------------------------------------|
| **nvim-cmp**| A completion engine for Neovim.                           | [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)         |
| **luasnip** | Snippet engine and collection for Neovim.                 | [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)         |
| **cmp-path**| Path completion source for `nvim-cmp`.                    | [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)         |
| **cmp-nvim-lsp**| Completion source for Neovim's built-in LSP client.   | [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) |

---

### Keymappings

| Keybinding      | Action                          | Description                                                                 |
|------------------|---------------------------------|-----------------------------------------------------------------------------|
| `<C-k>`         | Previous Item                  | Select the previous item in the completion menu.                           |
| `<C-j>`         | Next Item                      | Select the next item in the completion menu.                               |
| `<C-u>`         | Scroll Docs Up                 | Scroll the completion documentation upwards.                               |
| `<C-d>`         | Scroll Docs Down               | Scroll the completion documentation downwards.                             |
| `<C-e>`         | Close Completion Menu          | Abort or close the completion menu.                                        |
| `<C-CR>`        | Confirm Selection              | Confirm the selected completion, without automatically selecting if none.  |
| `<C-l>`         | Expand/Jump Snippet Forward    | Expand the snippet or jump to the next snippet placeholder (if available). |
| `<C-h>`         | Jump Snippet Backward          | Jump to the previous snippet placeholder.                                  |
| `<C-Space>`     | Ghost Text Accept or Complete  | Accept ghosted text suggestion from Copilot or trigger the completion menu.|

---

## Features 🌟

- **Preconfigured Sources**: The module includes essential sources like `luasnip`, `path`, and `nvim_lsp` to cover common completion needs.
- **Transparent Popup Window**: The completion menu has a clean, transparent appearance that blends well with most themes.
- **Snippet Support**: `luasnip` is set up to provide snippet expansion functionality out of the box.

---

## Usage 🚀

The CMP module is preconfigured and requires no additional inputs or complex setup. Simply include the module in your configuration:

```nix
modules.imports = [
  inputs.nvix.nvixModules.utils # Required dependency
  inputs.nvix.nvixModules.cmp
];
```

---

> [!NOTE]
> - The **`utils`** module is required to ensure this module works correctly.
> - This module is independent and can be integrated into any Neovim setup without requiring the full Nvix configuration.
