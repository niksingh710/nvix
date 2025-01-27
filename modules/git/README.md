# Git Module

The **Git Module** integrates git functionality directly into Neovim using the powerful [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) plugin. This module enables efficient interaction with git repositories through intuitive key mappings and enhanced visual feedback.

---

## 🛠️ Setup

To enable this module, add the following to your Nix configuration:

```nix
# Add to your Nix configuration
modules.imports = [
  inputs.nvix.nvixModules.utils
  inputs.nvix.nvixModules.git
];
```

---

## 🔑 Features

- **Git Integration:** Perform git actions directly from Neovim.
- **Inline Feedback:** View git diff and blame information inline.
- **Convenient Keymaps:** Intuitive keybindings for common git operations.

---

## 🔌 Mappings

### Normal Mode

| Key             | Action                       |
|-----------------|-----------------------------|
| `<Leader>ghS`   | Stage Buffer                |
| `<Leader>ghu`   | Undo Stage Hunk             |
| `<Leader>ghR`   | Reset Buffer                |
| `<Leader>ghp`   | Preview Hunk Inline         |
| `<Leader>ghb`   | Blame Line (Full)           |
| `<Leader>ghB`   | Blame Buffer                |
| `<Leader>gb`    | Blame Line                  |
| `<Leader>ghd`   | Diff This                   |
| `<Leader>ghD`   | Diff This (`~`)             |
| `[H`            | Navigate to Previous Hunk   |
| `]H`            | Navigate to Next Hunk       |
| `<Leader>ghs`   | Stage Hunk                  |
| `<Leader>ghr`   | Reset Hunk                  |

### Visual Mode

| Key             | Action                       |
|-----------------|-----------------------------|
| `<Leader>ghs`   | Stage Selected Hunk         |
| `<Leader>ghr`   | Reset Selected Hunk         |

### Operator & Select Mode

| Key | Action                 |
|-----|------------------------|
| `ih`| GitSigns Select Hunk  |

---

## 📋 Additional Features

This module leverages `gitsigns.nvim` for its functionality, providing:

- **Hunk Navigation:** Quickly jump between git hunks.
- **Inline Previews:** Preview changes in the current buffer.
- **Git Blame:** Display blame information inline.

---

## 📌 Notes

- This module is ideal for users who frequently work with git repositories.
- The keymaps are designed to be intuitive and non-intrusive, blending seamlessly into your workflow.

> Customize these mappings further to fit your personal preferences.
