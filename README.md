<p align="center" style="color:grey">

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


### Previews are in coming .... they are same as my previous [config.](https://github.com/niksingh710/nvim)
