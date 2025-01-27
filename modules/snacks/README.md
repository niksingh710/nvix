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
