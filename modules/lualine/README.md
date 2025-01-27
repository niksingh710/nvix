# 🎨 Lualine Module

The **Lualine Module** integrates the **Lualine** statusline plugin into Neovim. This module enhances your statusline with useful information, including the attached LSP server, and can be customized to fit your workflow.

---

## 🛠️ Setup

To enable this module, add the following to your Nix configuration:

```nix
# Add to your Nix configuration
modules.imports = [
  inputs.nvix.nvixModules.utils
  inputs.nvix.nvixModules.lualine
];
```

---

## 🔑 Features

- **LSP Integration**: Displays the currently attached LSP server in the statusline.
- **Customizable Statusline**: Fully configurable to show a variety of statusline elements such as current mode, git branch, and more.
- **Clean and Minimal**: Provides a visually appealing and minimalistic statusline that doesn’t distract from your coding.

---

## 📸 Preview

![Image](https://github.com/user-attachments/assets/aa37628c-f64b-4e7f-a3e3-de6411dc0d39)

---

## 📌 Notes

- The **Lualine** statusline is highly customizable. You can adjust the modules, sections, and elements shown in the statusline based on your needs.
- By default, this module will show the attached LSP server, helping you easily identify which language server is currently active.

> Customize the Lualine statusline further to match your personal preferences. 😊
