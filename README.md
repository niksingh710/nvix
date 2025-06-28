<p align="center" style="color:grey">

![image](https://github.com/niksingh710/nvix/assets/60490474/89503d51-ca86-4933-872f-3f60c32202a9)

<div align="center">
<table>
<tbody>
<td align="center">
<img width="2000" height="0"><br>

##### `"This configuration is modular by design—if you love a part of it, grab that slice, plug it into your Nixvim config, and roll with it!"`

![GitHub Stars](https://img.shields.io/github/stars/niksingh710/nvix?style=social) ![GitHub Forks](https://img.shields.io/github/forks/niksingh710/nvix?style=social) ![GitHub Issues](https://img.shields.io/github/issues/niksingh710/nvix) ![License: MIT](https://img.shields.io/badge/license-MIT-green) ![Nix Flake Compatible](https://img.shields.io/badge/Nix-Flake_Compatible-blue)

<img width="2000" height="0">
</td>
</tbody>
</table>
</div>
</p>

# Nvix

Nvix is a **modular**, **powerful**, and **reproducible** Neovim configuration framework powered by [Nixvim](https://github.com/nix-community/nixvim). It leverages the Nix ecosystem to provide flexible, reliable, and highly customizable Neovim environments—whether you need a lightweight config for quick edits or a comprehensive setup for full development workflows.

## Features

- **Modular by Design:** Each feature and plugin is its own module. Mix, match, or extend as you need.
- **Multiple Configurations:**
  - **Bare:** Minimal setup for fast, distraction-free editing and server use.
  - **Core:** Daily-driver configuration with LSP and language support.
  - **Full:** Comprehensive environment including advanced plugins (LaTeX, etc.).
- **Easy Customization:** Import only what you want, or override settings in `config.nvix`.
- **Flake Native:** Built for the modern Nix ecosystem.

## Quickstart

Run Nvix instantly with Nix (no install required):

```sh
nix run "github:niksingh710/nvix#<type>"
# <type> can be: bare | default | full
```

## Installation

### Prerequisites

- [Nix Package Manager](https://nixos.org/download.html) (multi-user recommended)
- Flakes enabled (`experimental-features = nix-command flakes`)
- Familiarity with [NixOS](https://nixos.org/) or [Home Manager](https://nix-community.github.io/home-manager/) is helpful

**Install Nix (multi-user):**
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
    sh -s -- install --no-confirm --extra-conf "trusted-users = $(whoami)"
```

### Add Nvix as a flake input

```nix
# In your flake.nix
inputs.nvix.url = "github:niksingh710/nvix";
```

### Use with NixOS or Home Manager

```nix
# For NixOS
environment.packages = [
  inputs.nvix.packages.${pkgs.system}.default
];

# For Home Manager
home.packages = [
  inputs.nvix.packages.${pkgs.system}.default
];
# Replace `default` with `bare`, `core`, or `full` as needed.
```

### Customization Example

```nix
inputs.nvix.packages.${pkgs.system}.default.extend {
  colorschemes.tokyodark.enable = true;
}
```
<sub>
If you encounter conflicting definitions, use `lib.mkForce` to override default values.
</sub>

## Using Plugins and Modules

Every plugin or feature in Nvix is a module, exposed under `nvixPlugins`.
For essential utilities, include the `common` module.

**Example: Importing modules in Nixvim:**
```nix
# Add to your flake inputs:
nvix.url = "github:niksingh710/nvix";

# In your Nixvim config:
modules = [
  inputs.nvix.nvixPlugins.common
  inputs.nvix.nvixPlugins.lualine
];
```

**Module Path Reference:**
- `plugins/filename.nix` → `inputs.nvix.nvixPlugins.filename`
- `plugins/somedir/default.nix` → `inputs.nvix.nvixPlugins.somedir`

## Configuration Types Overview

| Type     | Description                                                              | Includes         |
|----------|--------------------------------------------------------------------------|------------------|
| `bare`   | Fast, minimal setup—ideal for servers or quick edits                     | Just the basics  |
| `default`| Core configuration with sensible defaults, LSP, and language support     | `bare` + extras  |
| `full`   | All-in-one, feature-rich setup including advanced plugins (e.g. LaTeX)   | `default` + more |

## Previews

| ![1](https://github.com/user-attachments/assets/166946eb-716b-44b4-81c6-845ca6dfb411) | ![2](https://github.com/user-attachments/assets/bb1d6130-89f4-4fe5-92b1-1b7636cdacad) |
|---|---|
| ![3](https://github.com/user-attachments/assets/9ff23b31-eb85-40f2-b75b-5a09bac396e2) | ![4](https://github.com/user-attachments/assets/5766fb4f-3553-4008-ba0b-1fc5fa8a6dbe) |
| ![5](https://github.com/user-attachments/assets/3211a1e2-92f3-4dff-9b5c-8d4476f12a04) | ![6](https://github.com/user-attachments/assets/099cd474-b102-4b72-8ad9-f8f92f43dabd) |

**Fuzzy Finder:**
Nvix uses `Snacks.picker` (instead of Telescope) for an optimized fuzzy finding experience.

![picker](https://github.com/niksingh710/nvix/assets/60490474/52f91e06-5161-4217-8f84-5a6d390295a5)

## FAQs

**What is Nvix for?**
Nvix started as a Nix learning experiment and evolved into a robust, composable Neovim configuration framework.

**Why three configurations?**
- `bare`: Minimal, distraction-free
- `core`: Daily usage with LSP and language support
- `full`: Advanced workflows such as LaTeX

**Can I use just one module?**
Absolutely. Nvix is designed so you can import only what you need.

**Are contributions welcome?**
Yes! Docs, configs, plugins, suggestions—all are valued. Open a PR or issue.

**Why only some options in `config.nvix`?**
[Nixvim](https://github.com/nix-community/nixvim) already exposes most customization options. Nvix adds curated, ready-to-use modules.

### Contributing

> Just keep it simple, stupid! -> `kiss` design principle

You’re welcome to contribute in any way:
- Improve docs or fix typos
- Suggest features or plugin support
- Enhance language/LSP integration

**Important:**
This repository has undergone major revisions in the past, which has resulted in a larger history and increased cloning size.
To minimize download time and space, please use a single branch clone:

```sh
git clone --single-branch --branch master https://github.com/niksingh710/nvix.git

# ssh
git clone --single-branch --branch master git@github.com:niksingh710/nvix.git
```

Please open an issue or PR with your ideas or improvements!

### License

This project is licensed under the [MIT License](./LICENSE).

### Acknowledgments

- Thanks to [Nixvim](https://github.com/nix-community/nixvim) for providing the foundation and inspiration.

---

> Nvix is a personal project, but designed for flexibility and sharing.
> If you find it useful, please consider starring the repository!

Have questions or suggestions? [Open an issue](https://github.com/niksingh710/nvix/issues)—I’m always happy to help.

**Happy Nixing! ❄️**
