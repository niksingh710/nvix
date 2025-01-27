# 🔧 Utils Module

The **Utils Module** provides various utility functions and helpful configurations that can be used across your Neovim setup. It includes:

- A collection of icons for visual enhancements.
- Functions to simplify and standardize keymap creation.
- Functions for custom configurations, such as keybindings with specific options.

---

## 🛠️ Setup

To enable this module, add the following to your Nix configuration:

```nix
# Add to your Nix configuration
modules.imports = [
  inputs.nvix.nvixModules.utils
];
```

---

## 🔑 Functions

The **Utils Module** includes the following functions:

| Function                | Description                                                                 |
|-------------------------|-----------------------------------------------------------------------------|
| `mkKeymap`              | Creates a keymap with a given mode, key, action, and description.            |
| `mkKeymap'`             | Creates a keymap with a given mode, key, action, and no description.        |
| `mkKeymapWithOpts`      | Creates a keymap with custom options and a description.                      |
| `lazyKey`               | Defines a key with an action and a description without specifying a mode.   |
| `wKeyObj`               | Generates objects for **which-key** icons based on a list of strings.       |

---

## 📌 Notes

- The utility functions in this module help standardize the process of creating and managing keymaps across your Neovim setup.
- The `wKeyObj` function is particularly useful for generating icons and grouping them in **which-key**.
