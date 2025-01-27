# Firenvim Plugin

This module integrates the **Firenvim** plugin into your Neovim setup, allowing you to use Neovim directly in your web browser. It's a seamless way to edit text areas in browsers with the power of Neovim.

---

## 🛠️ Usage

Firenvim does not require any additional inputs. To enable it, simply include the following in your Nix configuration:

```nix
# Add to your Nix configuration
modules.imports = [
  inputs.nvix.nvixModules.utils
  inputs.nvix.nvixModules.firenvim
];
```

> **Note:** The `utils` module is required to ensure functionality.

---

## 🔑 Features

- Edit text areas in your web browser using Neovim.
- Lightweight and seamless integration.
- Retain all your Neovim configurations while working in the browser.

---

## 🔑 Keybindings

There are no specific keybindings required for Firenvim. Once activated, it will automatically detect text areas and open them in Neovim.

---

## 🔌 Browser Plugin Required

To use Firenvim effectively, you need to install its companion browser extension. This plugin bridges the gap between your browser and Neovim.

- [Firenvim Extension for Chrome](https://chromewebstore.google.com/detail/firenvim/egpjdkipkomnmjhjmdamaniclmdlobbo)
- [Firenvim Extension for Firefox](https://addons.mozilla.org/en-US/firefox/addon/firenvim/)

---

## 📋 Additional Notes

- Firenvim respects your existing Neovim configuration, including installed plugins and settings.
- Customize its behavior through Neovim's `firenvim` settings.

---

## 📷 Preview


![Image](https://github.com/user-attachments/assets/858d8ff3-0dd0-4402-b217-3bd82eb5780f)

---

## 🔗 Additional Notes

- Firenvim is ideal for those who want to bring their Neovim workflow into the browser.
- Explore Firenvim's [documentation](https://github.com/glacambre/firenvim) for advanced configurations.
