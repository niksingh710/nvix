# Copilot Module 🤖

The Copilot module brings GitHub Copilot's AI-powered coding assistance to your Neovim setup. It's pre-configured and seamlessly integrates with your environment, offering suggestions and enabling productivity while you code.

---

## Features 🌟

- **AI-Powered Assistance**: GitHub Copilot provides real-time coding suggestions based on context.
- **Pre-configured**: Works out of the box with no additional inputs required.
- **Keymap Integration**: Toggle and control Copilot directly from your Neovim interface.
- **CMP Integration**: Autocomplete ghosted suggestions with a simple keystroke.

---

## Keymappings

| Keybinding         | Action                              | Description                                                                                     |
|---------------------|-------------------------------------|-------------------------------------------------------------------------------------------------|
| `<leader>ac`       | Toggle Copilot                     | Toggles Copilot between enabled and disabled states.                                            |
| `<C-Space>`        | Auto-type ghosted suggestion        | Activates and completes the ghosted suggestion displayed by Copilot (via CMP integration).      |

---

## Usage 🚀

This module is independent and doesn't require any additional inputs in your `flake.nix`. Simply import it into your configuration:

```nix
modules.imports = [
  inputs.nvix.nvixModules.utils # Required dependency
  inputs.nvix.nvixModules.copilot
];
```

---

## Preview

![Placeholder: Copilot in Action](https://via.placeholder.com/800x400?text=Add+Preview+of+Copilot+Here)

---

> [!NOTE]
> - The **`utils`** module is required to ensure this module functions correctly.
> - This module can be integrated into any Neovim setup without requiring the full Nvix configuration.
