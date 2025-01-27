# 📚 TeX Module

The **TeX Module** integrates the full TeX and TeX Live suite for working with LaTeX documents and provides support for TeXLab as an LSP. This module enables powerful editing, compiling, and live linting for TeX files, helping streamline your LaTeX workflow in Neovim.

---

## 🛠️ Setup

To enable this module, add the following to your Nix configuration:

```nix
# Add to your Nix configuration
modules.imports = [
  inputs.nvix.nvixModules.utils
  inputs.nvix.nvixModules.tex
];
```

---

## 🔑 Features

- **Full TeX Setup**: Integrates the TeX Live distribution, providing a complete LaTeX environment.
- **TeXLab LSP**: Use **TeXLab** as an LSP to get powerful language features like autocompletion, diagnostics, and more.
- **Compilation Support**: Compile LaTeX documents directly from Neovim.
- **Error Diagnostics**: Live diagnostics and error highlighting as you write your LaTeX code.
- **Intelligent Autocompletion**: Automatic completion for commands, references, and more.
- **Inline Preview**: Get inline previews of LaTeX code in Neovim, such as equations and document sections.

---

## 📋 Key Features and Benefits

- **TeX Live Integration**: TeX Live is a complete TeX system, which includes support for many packages, making it ideal for compiling LaTeX documents.
- **TeXLab**: Provides a full-featured LSP for TeX files with autocompletion, syntax highlighting, and error diagnostics.
- **Compile from Neovim**: Compile `.tex` files directly from within Neovim using simple commands.
- **Rich Editing**: Get syntax highlighting, formatting, and quick navigation features tailored for LaTeX editing.
- **Error and Warning Linting**: View compilation errors and warnings directly within Neovim.

---

## 🔑 Keymap

- **`<leader>tl`**: Access additional TeX-related key mappings.

---

## 📌 Notes

- **TeXLab** will provide real-time diagnostics as you write your LaTeX documents.
- **TeX Live** is a complete LaTeX environment, so make sure it's installed and configured properly for full LaTeX functionality.
- Customize the key mappings as per your preferences to improve your LaTeX workflow.

---

This version includes the keymap for **`<leader>tl`** to access additional mappings.
