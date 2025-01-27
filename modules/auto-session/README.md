# Auto-Session Module 💾

The Auto-Session module enables session management in Neovim, making it easy to save, restore, and manage working sessions.

---

## Plugins Included

| Plugin Name       | Description                                                 | Repository Link                                           |
|-------------------|-------------------------------------------------------------|----------------------------------------------------------|
| **Auto-Session**  | A minimalist session manager for Neovim. Automatically saves and restores sessions. | [rmagatti/auto-session](https://github.com/rmagatti/auto-session) |

---

## Key Mappings ⌨️

| Key Mapping        | Action                        | Description                             |
|--------------------|-------------------------------|-----------------------------------------|
| `<leader>q.`       | `:SessionRestore`            | Restore the last saved session.         |
| `<leader>ql`       | `:Autosession search`        | List available sessions.                |
| `<leader>qd`       | `:Autosession delete`        | Delete a specific session.              |
| `<leader>qs`       | `:SessionSave`               | Save the current session.               |
| `<leader>qD`       | `:SessionPurgeOrphaned`      | Purge orphaned sessions.                |

---

## Usage 🚀

To include the Auto-Session module in your Nixvim configuration, add it to your flake inputs and module imports as shown below:

```nix
# Add Nvix to inputs
inputs.nvix.url = "github:niksingh710/nvix";

# Import the required modules
modules.imports = [
  inputs.nvix.nvixModules.utils # Required dependency
  inputs.nvix.nvixModules.auto-session
];
```

---

> [!NOTE]
> - The **`utils`** module is required to ensure this module works correctly. Ensure it is included in your configuration.
> - This module is designed to work independently; you can integrate it without adopting the full Nvix setup.
