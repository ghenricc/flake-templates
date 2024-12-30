# SPDX-FileCopyrightText: 2025 Carson Henrich <carson03henrich@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

{
  description = ""; # TODO(Base Template) CONFIGURE ME

  inputs = {
    nixpkgs-unstable.url = "github:NixOs/nixpkgs/nixos-unstable";
    nixpkgs.follows = "nixpkgs-unstable";
    devshell =
      {
        url = "github:numtide/devshell";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    nixago = {
      url = "github:nix-community/nixago";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    std = {
      url = "github:divnix/std";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        devshell.follows = "devshell";
        nixago.follows = "nixago";
      };
    };
    dev-configs = {
      url = "github:ghenricc/dev-configs";
      inputs = {
        std.follows = "std";
        devshell.follows = "devshell";
        nixago.follows = "nixago";
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  nixConfig = {
    extra-experimental-features = [ "nix-command" "flakes" ];
    extra-substituters = [
      "https://carsonhenrich.cachix.org"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "carsonhenrich.cachix.org-1:hahYg63yinXhJVLCZd49InX9Ewng2u0yS+gjgATkG5Q="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs =
    inputs @ { self
    , std
    , ...
    }:
    std.growOn
      {
        inherit inputs;
        cellsFrom = std.incl ./nix [ "src" "dev" ];
        cellBlocks = with std.blockTypes; [
          # src: Things for downstream usage
          # TODO(Base Template) BLOCKS GO HERE

          # dev: Dev Environment
          (nixago "configs")
          (devshells "shells" { ci.build = true; })
        ];
      }
      {
        devShells = std.harvest self [ "dev" "shells" ];
      };
}
