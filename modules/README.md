# 📦 Module Setup Guide

This guide provides instructions for importing and setting up modules in your Neovim configuration. Each module offers distinct functionalities and can be easily configured to enhance your workflow.

---

## 🛠️ Setup Instructions

To enable any of the modules, add the following lines to your Nix configuration:

1. **Import the Utils Module** (required by many modules):

```nix
# Add to your Nix configuration
modules.imports = [
  inputs.nvix.nvixModules.utils
];
```

2. **Import the Desired Module(s)**:

For each module you want to use, include it in the `modules.imports` section. For example:

```nix
# Example for enabling a module (e.g., Git, LSP, Treesitter)
modules.imports = [
  inputs.nvix.nvixModules.utils        # Always import the utils module
  inputs.nvix.nvixModules.git         # Replace with your chosen module
  inputs.nvix.nvixModules.lsp         # Add more modules as needed
];
```

Make sure to replace `inputs.nvix.nvixModules.git` and `inputs.nvix.nvixModules.lsp` with the actual module paths you wish to use.

---

## 🔑 Required Modules

### **1. Utils Module**
The **Utils Module** contains utility functions for creating keymaps, handling icons, and simplifying configuration. This module is required by many other modules and should be imported first.

Example functions from the **Utils Module**:
- `mkKeymap` for standard keymaps.
- `wKeyObj` for generating icons for **which-key**.
