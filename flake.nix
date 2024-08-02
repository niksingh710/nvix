{
  description = "A nixvim configuration";

  outputs =
    # NOTE: Not use flake-parts or understand it good enough to use everywhere
    { nixvim, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      perSystem = { system, ... }:
        let
          opts = {
            border = "rounded";
            transparent =
              "true"; # into string so that can be passed in lua code
          };

          pkgs = import inputs.nixpkgs {
            config.allowUnfree = true;
            inherit system;
          };
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit pkgs;
            module = import ./config; # import the module directly
            # You can use `extraSpecialArgs` to pass additional arguments to your module files
            extraSpecialArgs = {
              # inherit (inputs) foo;
              inherit inputs opts;
            } // import ./lib;
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default =
              nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };

          packages = {
            # Lets you run `nix run .` to start nixvim
            default = nvim;
          };
        };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

    tokyodark = {
      url = "github:tiagovla/tokyodark.nvim";
      flake = false;
    };

    markview = {
      url = "github:OXY2DEV/markview.nvim";
      flake = false;
    };

    ts-comments = {
      url = "github:folke/ts-comments.nvim";
      flake = false;
    };
    ntree-float = {
      url = "github:JMarkin/nvim-tree.lua-float-preview";
      flake = false;
    };
    buffer-manager = {
      url = "github:j-morano/buffer_manager.nvim";
      flake = false;
    };
    color-picker = {
      url = "github:ziontee113/color-picker.nvim";
      flake = false;
    };
    moveline = {
      url = "github:willothy/moveline.nvim";
      flake = false;
    };
    session-manager = {
      url = "github:Shatur/neovim-session-manager";
      flake = false;
    };
    md-pdf = {
      url = "github:arminveres/md-pdf.nvim";
      flake = false;
    };

    nvim-md = {
      url = "github:ixru/nvim-markdown";
      flake = false;
    };
    nvim-hl-md = {
      url = "github:yaocccc/nvim-hl-mdcodeblock.lua";
      flake = false;
    };

    windows = {
      url = "github:anuvyklack/windows.nvim";
      flake = false;
    };
    windows-mc = {
      url = "github:anuvyklack/middleclass";
      flake = false;
    };
    windows-a = {
      url = "github:anuvyklack/animation.nvim";
      flake = false;
    };
  };
}
