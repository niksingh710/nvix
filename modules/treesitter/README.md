# 🌳 Tree-sitter Module

The **Tree-sitter Module** integrates the power of **Tree-sitter** for syntax highlighting and incremental parsing. This module provides high-quality syntax highlighting and ensures efficient, fast parsing for various programming languages directly within Neovim.

---

## 🛠️ Setup

To enable this module, add the following to your Nix configuration:

```nix
# Add to your Nix configuration
modules.imports = [
  inputs.nvix.nvixModules.utils
  inputs.nvix.nvixModules.treesitter
];
```

---

## 🔑 Features

- **Syntax Highlighting**: Provides high-quality syntax highlighting for a wide range of programming languages.
- **Tree-sitter Parsing**: Efficient and incremental parsing, ensuring that syntax is parsed quickly and accurately.
- **Performance Optimizations**: Includes optimizations for performance, such as the ability to disable unnecessary parsers to reduce lag.
- **Text and Plaintext Tree-sitter Lag Fix**: Addresses any performance issues related to text and plaintext parsers.

---

## 📝 TODO

- [ ] Optimize Tree-sitter parsing for **text** and **plaintext** files to reduce lag.

---

This version directly addresses the text and plaintext file lag issues, with checkboxes for tracking progress.

## 📌 Notes

- **Tree-sitter** enables fast and incremental syntax parsing, ensuring that syntax highlighting is up to date as you type, without slowing down Neovim.
- For text and plaintext parsing, performance improvements are enabled by default to mitigate lag issues, but additional adjustments can be made to further enhance performance.

> Enjoy fast and accurate syntax highlighting and parsing with **Tree-sitter** in Neovim! 🚀
