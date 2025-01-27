# Colorscheme Module

This module provides support for managing and switching between multiple colorschemes for Neovim. The current supported themes are:

| Colorscheme  | Description                        |
|--------------|------------------------------------|
| tokyonight   | A clean, dark Neovim theme written in Lua. |
| tokyodark    | A darker alternative for a modern look. |

---

## 🛠️ Usage

To set your preferred colorscheme, add the following configuration:

```nix
# In your Nix configuration
colorscheme = "<name>"; # Replace <name> with "tokyonight" or "tokyodark"
```

### Example:

```nix
colorscheme = "tokyonight";
```

> **Note:** The `colorscheme` key allows you to set the active theme.

---

## 🔗 Plugin Sources

| Colorscheme  | Repository URL                                   |
|--------------|-------------------------------------------------|
| tokyonight   | [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) |
| tokyodark    | [tokyodark.nvim](https://github.com/tiagovla/tokyodark.nvim) |

> **Note:** `tokyodark` requires an additional input in your Nix flake:

```nix
# Add this input for tokyodark
inputs.tokyodark = {
  url = "github:tiagovla/tokyodark.nvim";
  flake = false;
};
```

---

## 🚀 Features

- Preconfigured colorschemes for quick setup.
- Easily switch between themes by updating the `colorscheme` key.
- Modern and visually appealing designs for Neovim.

---

## 📷 Preview

> This is same for tokyonight and tokyodark

![image](https://github.com/niksingh710/nvix/assets/60490474/52f91e06-5161-4217-8f84-5a6d390295a5)
