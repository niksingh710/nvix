# 🌐 LSP Module

The **LSP Module** enhances your development environment by integrating LSP (Language Server Protocol) support with a variety of powerful tools. This module includes features for formatting, code actions, diagnostics, and more, creating a seamless development experience.

---

## 🛠️ Setup

To enable this module, add the following to your Nix configuration:

```nix
# Add to your Nix configuration
modules.imports = [
  inputs.nvix.nvixModules.utils
  inputs.nvix.nvixModules.lsp
];
```

---

## 🔌 Mappings

### Normal Mode

| Key             | Action                                             |
|-----------------|---------------------------------------------------|
| `<Leader>/`     | Toggle comment                                    |
| `<Leader>lO`    | Force Otter                                        |
| `<Leader>la`    | Code Action (`Lspsaga`)                           |
| `<Leader>lo`    | Show Outline (`Lspsaga`)                          |
| `<Leader>lw`    | Show Workspace Diagnostics (`Lspsaga`)            |
| `gd`   | Go to Definition (`Lspsaga`)                      |
| `<Leader>lr`    | Rename (`Lspsaga`)                                |
| `gt`   | Go to Type Definition (`Lspsaga`)                 |
| `<Leader>l.`    | Show Line Diagnostics (`Lspsaga`)                 |
| `gpd`  | Peek Definition (`Lspsaga`)                       |
| `gpt`  | Peek Type Definition (`Lspsaga`)                  |
| `[e`            | Jump to Previous Diagnostic (`Lspsaga`)           |
| `]e`            | Jump to Next Diagnostic (`Lspsaga`)               |
| `K`             | Hover Doc, fallback to Lspsaga hover if no fold   |
| `zR`            | Open all folds (`Ufo`)                            |
| `zM`            | Close all folds (`Ufo`)                           |
| `zK`            | Peek Folded Lines (`Ufo`)                         |
| `<Leader>lq`    | Stop LSP                                           |
| `<Leader>li`    | LSP Info                                          |
| `<Leader>ls`    | Start LSP                                          |
| `<Leader>lR`    | Restart LSP                                        |
| `<C-s-k>`       | Signature Help                                     |
| `<Leader>lD`    | Snacks.Picker Definitions                             |
| `<Leader>lf`    | Format File                                        |
| `gD`   | Go to Declaration                                  |
| `gi`   | Go to Implementation                              |
| `gR`   | Go to References                                   |
| `gy`   | Go to Type Definition                             |
| `[d`            | Previous Diagnostic                               |
| `]d`            | Next Diagnostic                                   |
| `<Leader>lL`    | Toggle Diagnostics                                |
| `<Leader>ll`    | Toggle Virtual Text                               |

### Visual Mode

| Key             | Action                                             |
|-----------------|---------------------------------------------------|
| `<Leader>/`     | Toggle comment                                    |
| `<Leader>la`    | Code Action (`Lspsaga`)                           |
| `<Leader>lo`    | Show Outline (`Lspsaga`)                          |
| `<Leader>lw`    | Show Workspace Diagnostics (`Lspsaga`)            |
| `<Leader>lgd`   | Go to Definition (`Lspsaga`)                      |
| `<Leader>lr`    | Rename (`Lspsaga`)                                |

### Operator & Select Mode

| Key             | Action                                             |
|-----------------|---------------------------------------------------|
| `<Leader>/`     | Toggle comment                                    |
| `<Leader>la`    | Code Action (`Lspsaga`)                           |

---

## 🔑 Features

- **Conform Formatter** ✨: Automatically formats your code using Conform, supporting a wide variety of languages.
- **Lspsaga** 🛠️: Adds enhanced code actions, outline view, and LSP setup for improved navigation and diagnostics.
- **Otter** 🐾: Provides substring LSP support, allowing scripts in strings to have LSP diagnostics.
- **Ufo.nvim** 🗺️: Sets up folding using LSP and indentation, enabling efficient code navigation.

---

## 📌 Notes

Enabling this module will automatically configure these LSP tools, improving your coding experience with features like real-time diagnostics, automatic code formatting, and enhanced navigation.

> Customize these tools further to match your personal preferences and workflow. 😊
