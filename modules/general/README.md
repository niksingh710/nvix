# General Module

The **General Module** provides a set of comfortable configurations and mappings for Neovim. These are designed to work independently of any plugins, offering enhanced usability and quality-of-life improvements. Additionally, this module enables a few basic plugins to streamline your Neovim experience.

---

## 🛠️ Setup

To include this module in your Neovim configuration, simply add the following to your Nix configuration:

```nix
# Add to your Nix configuration
modules.imports = [
  inputs.nvix.nvixModules.utils
  inputs.nvix.nvixModules.general
];
```

> **Note:** The `utils` module is required for the proper functioning of this module.

---

## 🔑 Features

- **Convenient Mappings:** Frequently used keybindings for navigation, editing, and file operations.
- **Plugin Independence:** Designed to work without requiring additional plugins.
- **Enhanced Editing:** Includes mappings for smooth navigation, multi-line movements, and efficient indenting.

---

## 🔌 Mappings

### Visual Mode

| Key      | Action                      |
|----------|-----------------------------|
| `<C-s>`  | Saving File                 |
| `<C-c>`  | Escape                     |
| `<A-j>`  | Move Selected Line Down    |
| `<A-k>`  | Move Selected Line Up      |
| `<`      | Indent Out                 |
| `>`      | Indent In                  |
| `<Space>`| Mapped to Nothing          |

### Visual & Select Mode

| Key | Action     |
|-----|------------|
| `j` | Move Down  |
| `k` | Move Up    |

### Insert Mode

| Key      | Action              |
|----------|---------------------|
| `jk`     | Normal Mode         |
| `<C-s>`  | Save File           |
| `<A-j>`  | Move Line Down      |
| `<A-k>`  | Move Line Up        |

### Normal Mode

| Key         | Action                            |
|-------------|-----------------------------------|
| `<C-s>`     | Save the File                    |
| `<C-A-=>`   | Increase Number                  |
| `<C-A-->`   | Decrease Number                  |
| `<A-j>`     | Move Line Down                   |
| `<A-k>`     | Move Line Up                     |
| `<Leader>qq`| Quit All                         |
| `<Leader>qw`| Quit                             |
| `<Leader><Leader>`| Remove Highlight          |
| `<Leader>A` | Select All                       |
| `<Leader>\|` | Vertical Split                   |
| `<Leader>-` | Horizontal Split                 |
| `<Leader>o` | Open Files/Links Smartly                 |
| `n`         | Move to Next Search Result       |
| `N`         | Move to Previous Search Result   |

---

## 📋 Additional Plugins

This module enables a few basic plugins by default to improve usability.

---

## 📌 Notes

- This module provides a solid foundation for a Neovim configuration, with quality-of-life enhancements built-in.
- All mappings are designed to work seamlessly without interfering with other plugins or configurations.

> Customize these mappings further to suit your workflow and preferences.
