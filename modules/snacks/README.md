# 🍪 Snacks.nvim Module

The **Snacks.nvim Module** brings a collection of utility plugins to enhance your Neovim experience. With features like scratch buffers, git browsing, notification history, and more, it provides handy tools for a more productive development environment.

---

## 🛠️ Setup

To enable this module, add the following to your Nix configuration:

```nix
# Add to your Nix configuration
modules.imports = [
  inputs.nvix.nvixModules.utils
  inputs.nvix.nvixModules.snacks
];
```

---

## 🔑 Features

- **Big File Support**: Efficient handling of large files with `bigfile.enabled = true`.
- **Scroll Optimization**: Smooth scrolling with `scroll.enabled = true`.
- **Quick File Navigation**: Easily jump to files with `quickfile.enabled = true`.
- **Indentation**: Visualize indentation levels with `indent.enabled = true`.
- **Word Highlighting**: Highlight words across the buffer with `words.enabled = true`.
- **Status Column**: Enhanced status column with support for folds and git highlighting.
- **Notifier**: Customizable notifications with `notifier.enabled = true`.

---

## 🔌 Mappings

### Normal Mode

| Key             | Action                                             |
|-----------------|---------------------------------------------------|
| `<Leader>..`    | Toggle Scratch Buffer                              |
| `<Leader>.s`    | Select Scratch Buffer                              |
| `<Leader>sn`    | Show Notification History                         |
| `<Leader>.r`    | Rename file/variable + LSP                        |
| `<Leader>gB`    | Git Browse                                         |
| `<Leader>gf`    | Lazygit Current File History                      |
| `<Leader>gg`    | Open Lazygit                                      |
| `<Leader>gl`    | Lazygit Log (cwd)                                 |
| `<Leader>un`    | Dismiss All Notifications                         |

# Below are the telescope functionality switched to Snacks Picker

| Key             | Action                                               |
|-----------------|-----------------------------------------------------|
| `<Leader>st`    | Open TODO list           |
| `<Leader>sT`    | Open TODO/FIX/FIXME list  |
| `<Leader>sc`    | Open Telescope Commands list  |
| `<Leader>sh`    | Open Telescope Help Pages    |
| `<Leader>sk`    | Open Telescope Keymaps list    |
| `]t`            | Jump to Next TODO Comment  |
| `[t`            | Jump to Previous TODO Comment  |
| `<Leader>s,`    | Switch between Buffers  |
| `<Leader>:`     | Open Command History  |
| `<Leader>ff`    | Find Files in Root Directory  |
| `<Leader>f/`    | Grep Search in Current Working Directory  |
| `<Leader>fr`    | Open Recent Files            |
| `<Leader>fg`    | Find Files in Git Repo      |

### Telescope Input (Normal Mode)

| Key             | Action                                               |
|-----------------|-----------------------------------------------------|
| `q`             | Close Telescope (`require('telescope.actions').close`) |
| `s`             | Select horizontally (`require('telescope.actions').select_horizontal`) |
| `v`             | Select vertically (`require('telescope.actions').select_vertical`) |

### Telescope Undo (Normal Mode)

| Key             | Action                                               |
|-----------------|-----------------------------------------------------|
| `<cr>`             | Restores the state |
| `Y`             | Yanks the deletions |
| `y`             | Yanks the selection |
