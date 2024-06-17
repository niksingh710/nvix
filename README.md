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

<details> 
<summary>
Layout
  </summary>

```bash
 ./
├──  config/
│  ├──  lang/
│  └──  default.nix
├──  lib/
│  ├──  default.nix
│  └──  icons.nix
├──  flake.lock
├──  flake.nix
├──  LICENSE
└──  README.md
```

- All `.nix` files under the config/lang directory are automatically imported by the config/lang/default.nix file, excluding itself.
- The `config/default.nix` file is responsible for manually importing all configuration files within the config directory, allowing for selective inclusion of features.
- The `lib/default.nix` file is responsible for importing all utility functions and modules.
- The `config/general.nix` file contains small plugins that do not require extensive configuration.

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

##### Telescope

![image](https://github.com/niksingh710/nvix/assets/60490474/52f91e06-5161-4217-8f84-5a6d390295a5)


##### Dashboard
![image](https://github.com/niksingh710/nvix/assets/60490474/9f3bb154-a404-4e07-9eb5-168d0e591b85)

##### Lualine
![image](https://github.com/niksingh710/nvix/assets/60490474/14e81ab5-080a-40a7-a259-f486563881cb)
