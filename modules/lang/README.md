# 🌐 Lang Module

The **Lang Module** provides essential configurations for **LSP (Language Server Protocol)**, **formatters**, and other language-specific tools, streamlining your development workflow with support for various programming languages.

---

## 🛠️ Setup

To enable this module, add the following to your Nix configuration:

```nix
# Add to your Nix configuration
modules.imports = [
  inputs.nvix.nvixModules.utils
  inputs.nvix.nvixModules.lang
];
```

---

## 🔑 Features

- **LSP Support**: Automatically sets up LSP servers for languages like Python, JavaScript, Go, and more.
- **Formatter Integration**: Integrates formatters like `black`, `prettier`, `clang-format`, etc.
- **Language-Specific Tools**: Configures additional tools like linters and debuggers to enhance the development experience.

---

## 📌 Notes

Having this module enabled will automatically set up the languages and tools you have configured, ensuring you have a smooth, ready-to-go development environment.

> Customize these configurations further to fit your personal preferences. 😊
