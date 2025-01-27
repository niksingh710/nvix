<p align="center" style="color:grey">

![image](https://github.com/niksingh710/nvix/assets/60490474/89503d51-ca86-4933-872f-3f60c32202a9)

<div align="center">
<table>
<tbody>
<td align="center">
<img width="2000" height="0"><br>

##### `"This configuration is modular by design—if you love a part of it, grab that slice, plug it into your Nixvim config, and roll with it!"`

Nvix is a **modular** and **powerful** Neovim configuration built over [Nixvim](https://github.com/nix-community/nixvim). It leverages the Nix ecosystem to create flexible, reproducible setups for Neovim. Whether you need a minimal config for quick edits or a fully-featured development environment, Nvix has you covered!

![GitHub Stars](https://img.shields.io/github/stars/niksingh710/nvix?style=social) ![GitHub Forks](https://img.shields.io/github/forks/niksingh710/nvix?style=social) ![GitHub Issues](https://img.shields.io/github/issues/niksingh710/nvix) ![License: MIT](https://img.shields.io/badge/license-MIT-green) ![Nix Flake Compatible](https://img.shields.io/badge/Nix-Flake_Compatible-blue)

<img width="2000" height="0">
</td>
</tbody>
</table>
</div>
</p>

![Placeholder: Showcase Image](https://via.placeholder.com/800x400?text=Showcase+Your+Editor+Configuration+Here)

---

## 🛠️ Why Use Nvix?

- **Fully Modularized**: Every configuration is split into modules, making it easy to use only what you need.
- **Three Configurations**:
  - **Bare**: Minimal setup for quick edits on any server.
  - **Core**: A daily-driver setup with LSP and language support.
  - **Full**: All-in-one, feature-rich setup, including LaTeX support.
- **Customizable**: Import modules individually or override configurations using `config.nvix`.

---

## 🔧 Installation

<details>
  <summary>
  Ensure that you have nix installed on your system and flakes enabled.
  </summary>

#### Nix pkg manager installation

```bash
# This is multiuser installation of nix requires sudo
sh <(curl -L https://nixos.org/nix/install) --daemon
```

</details>

#### Add the Nvix repo as an input in your flake:

```nix
inputs = {
  nvix.url = "github:niksingh710/nvix";
};

environment.packages = [
  inputs.nvix.packages.${pkgs.system}.default
];
# Replace `default` with `bare`, `core`, or `full` as needed
```

For further customization, use:

```nix
inputs.nvix.packages.${pkgs.system}.default.extend { }
```

Check the `variables.nix` file or the [Nixvim Wiki](https://nix-community.github.io/nixvim/platforms/standalone.html?highlight=extend#extending-an-existing-configuration) for additional configuration options.

---

## 📚 How to Quick Run Nvix (Without installing)

### Bare Configuration
For a minimal setup with basic mappings and options, ideal for quick edits:
```sh
nix run "github:niksingh710/nvix#bare"
```

### Core Configuration
For a fully-featured daily driver with LSP and language support:
```sh
nix run "github:niksingh710/nvix#core"
```

### Full Configuration
For a comprehensive setup with jumbo packs (e.g., LaTeX support):
```sh
nix run "github:niksingh710/nvix#full"
```

---

## 🏆 Features

- **Generalized Design**: Use specific modules (e.g., lualine) without adopting the entire configuration.
- **Community-Driven**: Plans to support multiple standardized configurations for popular plugins (e.g., lualine).
- **Lightweight to Full-Featured**: Choose a setup based on your needs.

---

## 🔬 Module Documentation

Each module has its own README with usage details.
The configurations build on one another:
- **Bare**: Minimal setup.
- **Core**: Includes everything in Bare.
- **Full**: Includes everything in Core.

### Module Overview

| Module      | Included In         | Description                                                     |
|-------------|---------------------|-----------------------------------------------------------------|
| [aesthetics](./modules/aesthetics/README.md) | Core, Full    | Utility functions required by other modules.                    |
| [utils](./modules/utils/README.md)         | Bare, Core, Full    | Utility functions required by other modules.                    |
| [general](./modules/general/README.md)     | Bare, Core, Full    | Basic Neovim settings (e.g., number, relativenumber).           |
| [lualine](./modules/lualine/README.md)     | Core, Full          | Status line configuration.                                      |
| [auto-session](./modules/auto-session/README.md) | Core, Full    | Auto-session management for Neovim sessions.                    |
| [buffer](./modules/buffer/README.md)       | Bare, Core, Full          | Buffer-related features and management.                         |
| [cmp](./modules/cmp/README.md)             | Core, Full          | Completion engine setup and configuration.                      |
| [colorschemes](./modules/colorschemes/README.md) | Bare, Core, Full           | Themes for Neovim, including TokyoDark and TokyoNight.          |
| [copilot](./modules/copilot/README.md)     | Bare, Core, Full                | GitHub Copilot integration in Neovim.                           |
| [dashboard](./modules/dashboard/README.md) | Core, Full          | Neovim start dashboard and related setup.                       |
| [explorer](./modules/explorer/README.md)   | Bare, Core, Full          | File explorer integration, including neo-tree and oil.          |
| [firenvim](./modules/firenvim/README.md)   | Core, Full          | Browser-based text editing with Firenvim.                       |
| [git](./modules/git/README.md)             | Core, Full          | Git-related functionality and configuration in Neovim.          |
| [lang](./modules/lang/README.md)           | Core, Full          | Language-specific configurations for various languages.         |
| [lsp](./modules/lsp/README.md)             | Core, Full                | Language Server Protocol (LSP) setup for enhanced development.  |
| [snacks](./modules/snacks/README.md)       | Core, Full                | Collection of utility plugins for Neovim.                       |
| [telescope](./modules/telescope/README.md) | Core, Full          | Search and file navigation using the Telescope plugin.          |
| [tex](./modules/tex/README.md)             | Full                | Full TeX/TeXLive/TeXLab setup for LaTeX document editing.        |
| [treesitter](./modules/treesitter/README.md) | Core, Full         | Syntax highlighting and parsing with Treesitter.                 |

This table lists the modules, where they are included (`Bare`, `Core`, `Full`), and a brief description. You can add or adjust the descriptions for each module accordingly.For detailed usage, refer to each module's README.

> [!NOTE]
> If you find something undocumented or have a better way of documenting, please share—it will be integrated. An auto-doc generator would also be a great addition; if you know how to implement one, please share or contribute.
> With time, more relevant plugins will be added.

---

### Previews

| ![image](https://github.com/user-attachments/assets/166946eb-716b-44b4-81c6-845ca6dfb411) | ![image](https://github.com/user-attachments/assets/bb1d6130-89f4-4fe5-92b1-1b7636cdacad) |
|-----------------------------------------------|----------------------------------------|
| ![image](https://github.com/user-attachments/assets/9ff23b31-eb85-40f2-b75b-5a09bac396e2) | ![image](https://github.com/user-attachments/assets/5766fb4f-3553-4008-ba0b-1fc5fa8a6dbe) |
| ![image](https://github.com/user-attachments/assets/3211a1e2-92f3-4dff-9b5c-8d4476f12a04) | ![image](https://github.com/user-attachments/assets/099cd474-b102-4b72-8ad9-f8f92f43dabd) |

##### Telescope

![image](https://github.com/niksingh710/nvix/assets/60490474/52f91e06-5161-4217-8f84-5a6d390295a5)

---

## 🧩 FAQs

### What is the purpose of Nvix?
Nvix was initially created as a learning experiment while exploring Nix. Over time, it evolved into a modular and flexible configuration for Neovim.

### Why are there three configurations?
- **Bare**: For lightweight, minimal editing without distractions.
- **Core**: For regular usage with full LSP and language support.
- **Full**: For advanced workflows requiring plugins like LaTeX.

### Can I use specific modules without the full configuration?
**Absolutely!** Nvix is modular, so you can pick and choose modules (e.g., lualine) to include in your setup. This allows you to quickly spin up an editor with your preferences without adopting the full configuration.

### Are there plans for community contributions?
**Yes!** The goal is to include standardized configurations for popular plugins, allowing for user-specific choices via `config.nvix`.

### Why are there limited exposed options in `config.nvix`?
Nixvim already exposes most options for customization. As new standardized configurations are added, more options will be exposed where needed.

---

## 🙏 How to Contribute

Contributions are welcome! Here’s how you can help:

- Fix typos or improve documentation.
- Suggest better configurations or enhancements.
- Request support for new plugins or options.
- Share your expertise in configuring LSP or plugins for specific languages.

Create an issue or a PR—I’ll address it as soon as possible!

---

## 🔄 Example: Using a Module

Initialize a new Nixvim configuration:
```sh
nix flake init -t "github:nix-community/nixvim"
```

Then, add Nvix modules to your configuration:

```nix
# Add Nvix to inputs
inputs = {
  ...
  nvix.url = "github:niksingh710/nvix";
  ...
};

# Import required modules
modules.imports = [
  ./config
  inputs.nvix.nvixModules.utils
  inputs.nvix.nvixModules.lualine
];
```

> [!NOTE]
> The `utils` module is required for most configurations. Some modules depend on custom-packaged plugins—refer to their README for details.

---

## ✅ To-Do

- [ ] Add more community-standard configurations.
- [ ] Increase the number of exposed options in `config.nvix`.
- [ ] Improve support for language-specific LSPs.

---

## 🌐 License

This project is licensed under the [MIT License](./LICENSE).

---

## 🙌 Acknowledgments

Nvix wouldn’t be possible without inspiration and tools from the following repositories:

- [Nixvim](https://github.com/nix-community/nixvim)

---

## 💖 Thanks for Reading!

Nvix is a personal project, but I’ve designed it to be flexible and reusable. If you find it helpful, give it a star on GitHub!

Have questions or suggestions? Feel free to open an issue—I’m always looking to improve.

---

Happy coding! ⚛️
