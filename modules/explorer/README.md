# Explorer Module

This module integrates powerful file exploration plugins into your Neovim setup. Users can choose between three supported options: **Neo-tree**, **Oil**, and **Mini.files**. Each offers unique capabilities tailored to different workflows.

---

## 🛠️ Usage

To enable an explorer, configure it in your Nix setup by setting the appropriate option. Below are the steps for each explorer:

### General Configuration

```nix
# Add to your Nix configuration
modules.imports = [
  inputs.nvix.nvixModules.utils
  inputs.nvix.nvixModules.explorer
];

config.nvix.explorer.<name> = enable;  # Replace <name> with neo-tree, oil, or mini
```

> **Note:** The `utils` module is required to ensure functionality.

---

## 🔑 Features

- Seamless integration with popular file explorer plugins.
- Choose between **Neo-tree**, **Oil**, and **Mini.files**.
- Configurable keybindings for each explorer.

---

## 🔑 Keybindings

Depending on the explorer you enable, the following default keybindings will be mapped:

| Keybinding | Action              | Explorer  |
|------------|---------------------|-----------|
| `<leader>e`| Open File Explorer  | Neo-tree  |
| `<leader>e`| Open File Explorer  | Oil       |
| `<leader>e`| Open File Explorer  | Mini.files|

---

## 📋 Plugin-Specific Details

### **Neo-tree**
- **Description:** A modern file explorer with a rich set of features.
- **Keybinding:** `<leader>e` opens the Neo-tree explorer.
- **No additional inputs are required.**

---

### **Oil**
- **Description:** A unique file explorer that extends Neovim's capabilities with advanced integrations.
- **Keybinding:** `<leader>e` opens the Oil explorer.

#### Additional Inputs for Oil
To enable Oil's advanced features such as LSP diagnostics and VCS status, add the following to your flake inputs:

```nix
  oil-vcs-status = {
    url = "github:SirZenith/oil-vcs-status";
    flake = false;
  };

  oil-lsp-diagnostics = {
    url = "github:JezerM/oil-lsp-diagnostics.nvim";
    flake = false;
  };
```

---

### **Mini.files**
- **Description:** A lightweight and simple file explorer for quick navigation.
- **Keybinding:** `<leader>e` opens the Mini.files explorer.
- **No additional inputs are required.**

---

## 📷 Preview

| mini.files | neo-tree (default) | oil.nvim |
|-|-|-|
|![Image](https://github.com/user-attachments/assets/00f806ef-1730-4cf7-9183-c6b92d9787ec)|![Image](https://github.com/user-attachments/assets/ee68fbef-8dac-4961-be8e-05f52596aee9)|![Image](https://github.com/user-attachments/assets/c50ec8a4-461c-45f2-b929-c878aed72f66)|

---

## 🔗 Additional Notes

- Choose the explorer that best suits your workflow.
- Customize the layout, behavior, and keybindings as needed.
- For Oil, ensure the required flake inputs are included if advanced features are desired.
