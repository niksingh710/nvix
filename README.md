<p align="center" style="color:grey">

![image](https://github.com/niksingh710/nvix/assets/60490474/89503d51-ca86-4933-872f-3f60c32202a9)

<div align="center">
<table>
<tbody>
<td align="center">
<img width="2000" height="0"><br>

### Neovim Configuration

Welcome to my Neovim configuration, inspired and powered by [Nixvim](https://github.com/nix-community/nixvim).<br>
This setup is a port of my previous configuration, which you can find [here](https://github.com/niksingh710/nvim).<br>
I've switched to using `nix` for its many advantages, which far outweigh any drawbacks.

![GitHub repo size](https://img.shields.io/github/repo-size/niksingh710/nvix)
![GitHub Org's stars](https://img.shields.io/github/stars/niksingh710%2Fnvix)
![GitHub forks](https://img.shields.io/github/forks/niksingh710/nvix)
![GitHub last commit](https://img.shields.io/github/last-commit/niksingh710/gdots)

<img width="2000" height="0">
</td>
</tbody>
</table>
</div>
</p>

| Type   | Status                                                                              |
| ------ | ----------------------------------------------------------------------------------- |
| `bare` | Simple Most minimal Config to get running quickly. (Contains fzf and neo-tree)      |
| `base` | A Complete Set for Development and ideal for use                                    |
| `full` | Also contails all of the above + tex stuff (They are heavy on download, `few gigs`) |

<small> `bare` config is meant to use with `nix run` on virtual system or somewhere I wanna get the job done quickly</small><br>
<small> `base` config is the default package and it is meat to be used normally.</small><br>
<small> `full` config contains `tex/latex` setup the package download is heavy that's why it is not recommended to have always.</small><br>

<details>
<summary>
Layout
  </summary>

```bash

 ./
├──  config/
│  ├──  base/
│  ├──  core/
│  └──  default.nix
├──  lang/
│  ├──  default.nix
│  ├──  lua.nix
│  └──  shell.nix
├──  lib/
│  ├──  default.nix
│  └──  icons.nix
├──  pkgs/
│  └──  default.nix
├──  variables/
│  └──  default.nix
├──  flake.lock
├──  flake.nix
├──  LICENSE
└──  README.md
```

- Every file in a dir is imported by `default.nix`. You don't need to import them manually.
- The `lib/default.nix` file is responsible for importing all utility functions and modules.
- The `general.nix` file contains small plugins that do not require extensive configuration.

> I have added files in `config/lang` still not working `:womp:`.
> Ensure you have done `git add <newfile>` that's how flakes work. (`git restore --staged .` to revert). \[Same for any new file.\]

> How to update plugins to latest version? -> `nix flake update` should do that.
> Also I regularly update the flake.lock file.

</details>

### Installation

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

##### Quick run

As the config is based on flakes you can run it quickly without any long code snippet.

```bash
nix run "github:niksingh710/nvix"
```

##### How I use it on my nix config

```nix
# inputs
nvix.url = "github:niksingh710/nvix";

# Overlay
nvix = inputs.nvix.packages.${pkgs.system}.<type>.extend {
    config.colorschemes.tokyonight.settings.transparent = true;
};

home.packages = [
    nvix
];

```

<details>
  <summary>
    To run a specific config
  </summary>

```bash
nix run "github:niksingh710/nvix#bare"
nix run "github:niksingh710/nvix#base"
nix run "github:niksingh710/nvix#full"
```

</details>

##### Installing on non-NixOS systems

```bash
nix profile install "github:niksingh710/nvix"
```

##### Installing on NixOS systems

```nix
# flake input (ensure it is using unstable input of nixpkgs as i prefer that)
{
  inputs.nvix = {
    url = "github:niksingh710/nvix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}

# flake module pkg install or home-manager package (in my config i manager system variable)
# you may need to adjust that accordingly.
  [
    inputs.nvix.packages.${system}.default
  ];
```

### Previews

> [!NOTE]
> The Screenshots are taken after I have installed my configs via my [ndots](https://github.com/niksingh710/ndots).<br>
> I utilize `extend` feature of nixvim there to update my colorscheme and have the one from wallpaper.

| ![image](https://github.com/user-attachments/assets/166946eb-716b-44b4-81c6-845ca6dfb411) | ![image](https://github.com/user-attachments/assets/bb1d6130-89f4-4fe5-92b1-1b7636cdacad) |
|-----------------------------------------------|----------------------------------------|
| ![image](https://github.com/user-attachments/assets/9ff23b31-eb85-40f2-b75b-5a09bac396e2) | ![image](https://github.com/user-attachments/assets/5766fb4f-3553-4008-ba0b-1fc5fa8a6dbe) |
| ![image](https://github.com/user-attachments/assets/3211a1e2-92f3-4dff-9b5c-8d4476f12a04) | ![image](https://github.com/user-attachments/assets/099cd474-b102-4b72-8ad9-f8f92f43dabd) |

##### Telescope

![image](https://github.com/niksingh710/nvix/assets/60490474/52f91e06-5161-4217-8f84-5a6d390295a5)

<details>
  <summary>

### Tip to get this kind of blend on any theme.

  </summary>

  ```lua
      vim.api.nvim_exec([[
        function! CustomTelescopeHighlights() abort
          " Fetching colors from core Neovim highlight groups
          let fg = synIDattr(hlID('Normal'), 'fg')
          let bg0 = synIDattr(hlID('Normal'), 'bg')
          let bg1 = synIDattr(hlID('NormalFloat'), 'bg')
          let orange = synIDattr(hlID('WarningMsg'), 'fg')
          let purple = synIDattr(hlID('Statement'), 'fg')
          let green = synIDattr(hlID('String'), 'fg')
          let red = synIDattr(hlID('ErrorMsg'), 'fg')

          " Setting custom highlights for Telescope
          call nvim_set_hl(0, 'TelescopeMatching', {'fg': orange})
          call nvim_set_hl(0, 'TelescopeSelection', {'fg': fg, 'bg': bg1, 'bold': v:true})
          call nvim_set_hl(0, 'TelescopePromptPrefix', {'bg': bg1})
          call nvim_set_hl(0, 'TelescopePromptNormal', {'bg': bg1})
          call nvim_set_hl(0, 'TelescopeResultsNormal', {'bg': bg0})
          call nvim_set_hl(0, 'TelescopePreviewNormal', {'bg': bg0})
          call nvim_set_hl(0, 'TelescopePromptBorder', {'bg': bg1, 'fg': bg1})
          call nvim_set_hl(0, 'TelescopeResultsBorder', {'bg': bg0, 'fg': bg0})
          call nvim_set_hl(0, 'TelescopePreviewBorder', {'bg': bg0, 'fg': bg0})
          call nvim_set_hl(0, 'TelescopePromptTitle', {'bg': purple, 'fg': bg0})
          call nvim_set_hl(0, 'TelescopeResultsTitle', {'fg': bg0})
          call nvim_set_hl(0, 'TelescopePreviewTitle', {'bg': green, 'fg': bg0})
          call nvim_set_hl(0, 'CmpItemKindField', {'bg': red, 'fg': bg0})

          " Make cmp menu transparent
          call nvim_set_hl(0, 'PMenu', {'bg': 'NONE'})
        endfunction

        " Call the function to apply the custom highlights
        call CustomTelescopeHighlights()
      ]], false)

```
</details>

##### Dashboard

![image](https://github.com/niksingh710/nvix/assets/60490474/9f3bb154-a404-4e07-9eb5-168d0e591b85)

##### Lualine

![image](https://github.com/niksingh710/nvix/assets/60490474/14e81ab5-080a-40a7-a259-f486563881cb)
