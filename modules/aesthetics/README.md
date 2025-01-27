# Aesthetics Module 🎨

The Aesthetics module enhances the visual and interactive experience of Neovim with the following plugins:

---

## Plugins Included

| Plugin Name                  | Description                                                     | Repository Link                                        |
|------------------------------|-----------------------------------------------------------------|-------------------------------------------------------|
| **Dressing.nvim**            | Enhances Neovim's built-in UI components with better styling.  | [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim) |
| **Noice.nvim**               | Provides a modern and highly customizable notification and message interface. | [folke/noice.nvim](https://github.com/folke/noice.nvim) |
| **Fidget.nvim**              | Adds a lightweight, minimal progress indicator for LSP operations. | [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim) |

---

## Usage 🚀

To include the Aesthetics module in your Nixvim configuration, add it to your flake inputs and module imports as shown below:

```nix
# Add Nvix to inputs
inputs.nvix.url = "github:niksingh710/nvix";

# Import the required modules
modules.imports = [
  inputs.nvix.nvixModules.utils # Required dependency
  inputs.nvix.nvixModules.aesthetics
];
```

---

> [!NOTE]
> - The **`utils`** module is required to ensure this module works correctly. Ensure it is included in your configuration.
> - This module is designed to work independently; you can integrate it without adopting the full Nvix setup.
