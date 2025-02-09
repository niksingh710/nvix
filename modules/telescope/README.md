# 🔭 Telescope Module

The **Telescope Module** integrates the **Telescope** plugin into Neovim, providing powerful searching and navigation features. It enhances your workflow with an intuitive interface for finding files, searching text, browsing git files, and more. Additionally, it integrates **Todo-comments** to quickly navigate TODO and FIXME comments in your codebase.

---

## 🛠️ Setup

To enable this module, add the following to your Nix configuration:

```nix
# Add to your Nix configuration
modules.imports = [
  inputs.nvix.nvixModules.utils
  inputs.nvix.nvixModules.telescope
];
```

---

## 🔑 Features

- **File Search**: Easily find files with `Telescope find_files`.
- **Live Grep**: Search for content in your project with `Telescope live_grep`.
- **Recent Files**: Quickly access recently opened files with `Telescope oldfiles`.
- **Git Integration**: Browse git files and git history with `Telescope git_files`.
- **Todo Comments**: Navigate TODO, FIXME, and other comments with **todo-comments** integration.
- **Command History**: View and reuse previous commands with `Telescope command_history`.
- **Help Pages & Keymaps**: Access Neovim help pages and keymap listings using Telescope.
- **Buffer Switching**: Switch between open buffers with `Telescope buffers`.

---

## 🔌 Mappings

### Normal Mode

| Key             | Action                                               |
|-----------------|-----------------------------------------------------|
| `<Leader>st`    | Open TODO list (`TodoTelescope theme=ivy`)          |
| `<Leader>sT`    | Open TODO/FIX/FIXME list (`TodoTelescope theme=ivy keywords=TODO,FIX,FIXME`) |
| `<Leader>sc`    | Open Telescope Commands list (`Telescope builtin theme=dropdown previewer=false`) |
| `<Leader>sh`    | Open Telescope Help Pages (`Telescope help_tags`)   |
| `<Leader>sk`    | Open Telescope Keymaps list (`Telescope keymaps`)   |
| `]t`            | Jump to Next TODO Comment (`todo-comments.jump_next()`) |
| `[t`            | Jump to Previous TODO Comment (`todo-comments.jump_prev()`) |
| `<Leader>fb`    | Switch between Buffers (`Telescope buffers sort_mru=true sort_lastused=true`) |
| `<Leader>:`     | Open Command History (`Telescope command_history`) |
| `<Leader>ff`    | Find Files in Root Directory (`Telescope find_files`) |
| `<Leader>f/`    | Grep Search in Current Working Directory (`Telescope live_grep`) |
| `<Leader>fr`    | Open Recent Files (`Telescope oldfiles`)           |
| `<Leader>fg`    | Find Files in Git Repo (`Telescope git_files`)     |

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

---

## 📌 Notes

- **Telescope** is highly customizable and provides numerous ways to search and navigate your project efficiently.
- The **Todo-comments** integration makes it easier to track and jump to TODO and FIXMEs in your code.
- All keymaps are designed for quick access to essential Telescope features, speeding up your workflow.

> Feel free to tweak the mappings and settings to suit your personal workflow. 🚀
