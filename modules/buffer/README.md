# Buffer Module 📁

The Buffer module provides enhanced buffer and tab management in Neovim. It includes tools to manage buffers, navigate between them efficiently, and work with tabs seamlessly.

---

## Plugins Included

| Plugin Name       | Description                                     | Repository Link                                                   |
|-------------------|-------------------------------------------------|------------------------------------------------------------------|
| **Buffer Manager**| A Neovim plugin for managing buffers with ease. | [j-morano/buffer_manager.nvim](https://github.com/j-morano/buffer_manager.nvim) |
| **Harpoon**       | Quick file navigation and management tool.      | [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)  |
| **Bufferline**    | A plugin to enhance the Neovim buffer line UI.  | [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) |

---

## Key Mappings ⌨️

| Key Mapping        | Action                                | Description                                        |
|--------------------|---------------------------------------|--------------------------------------------------|
| `<leader>b.`       | `:lua require('harpoon.mark').add_file()`  | Add file to Harpoon.                             |
| `<leader>bm`       | `:lua require('buffer_manager.ui').toggle_quick_menu()` | Open Buffer Manager menu.                       |
| `<leader>bb`       | `:lua require('harpoon.ui').toggle_quick_menu()` | Open Harpoon UI menu.                           |
| `<leader>bp`       | `:BufferLinePick`                    | Pick a buffer from the buffer line.              |
| `<leader>bP`       | `:BufferLineTogglePin`               | Pin or unpin the current buffer.                 |
| `<leader>bd`       | `:BufferLineSortByDirectory`         | Sort buffers by directory.                       |
| `<leader>be`       | `:BufferLineSortByExtension`         | Sort buffers by extension.                       |
| `<leader>bt`       | `:BufferLineSortByTabs`              | Sort buffers by tabs.                            |
| `<leader>bL`       | `:BufferLineCloseRight`              | Close all buffers to the right of the current one.|
| `<leader>bH`       | `:BufferLineCloseLeft`               | Close all buffers to the left of the current one.|
| `<leader>bc`       | `:BufferLineCloseOther`              | Close all buffers except the current one.        |
| `<leader>qc`       | `:bp | bd #`                         | Close the current buffer.                        |
| `<a-s-h>`          | `:BufferLineMovePrev`                | Move the current buffer to the left.             |
| `<a-s-l>`          | `:BufferLineMoveNext`                | Move the current buffer to the right.            |
| `<s-h>`            | `:BufferLineCyclePrev`               | Switch to the previous buffer.                   |
| `<s-l>`            | `:BufferLineCycleNext`               | Switch to the next buffer.                       |
| `<leader><tab>j`   | `:tabn`                              | Go to the next tab.                              |
| `<leader><tab>k`   | `:tabp`                              | Go to the previous tab.                          |
| `<leader><tab>l`   | `:tabn`                              | Go to the next tab.                              |
| `<leader><tab>h`   | `:tabp`                              | Go to the previous tab.                          |
| `<leader><tab>q`   | `:tabclose`                          | Close the current tab.                           |
| `<leader><tab>n`   | `:tabnew`                            | Open a new tab.                                  |

---

## Usage 🚀

To include the Buffer module in your Nixvim configuration, add the necessary inputs and module imports as shown below:

```nix
# Add Nvix and Buffer Manager to inputs
inputs = {
  nvix.url = "github:niksingh710/nvix";
  buffer-manager = {
    url = "github:j-morano/buffer_manager.nvim";
    flake = false;
  };
};

# Import the required modules
modules.imports = [
  inputs.nvix.nvixModules.utils # Required dependency
  inputs.nvix.nvixModules.buffer
];
```

---

> [!NOTE]
> - The **`utils`** module is required to ensure this module works correctly. Ensure it is included in your configuration.
> - This module is designed to work independently; you can integrate it without adopting the full Nvix setup.
