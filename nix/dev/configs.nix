# SPDX-FileCopyrightText: 2025 Carson Henrich <carson03henrich@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

{ inputs
, cell
,
}:
let
  inherit (inputs) nixpkgs;
  inherit (inputs.cells.src) templates;
  inherit (inputs.std) dmerge;
  inherit (inputs.std.lib.dev) mkNixago;
  inherit (inputs.dev-configs.src) cfg;
  repository = "flake-templates";
  l = nixpkgs.lib // builtins;
in
{
  # Base Config: https://github.com/ghenricc/dev-configs/blob/main/nix/src/cfg/cog.nix 
  # Config Reference: https://docs.cocogitto.io/reference/config.html
  cog = mkNixago cfg.cog {
    data.changelog = {
      inherit repository;
      remote = "github.com";
      owner = "ghenricc";
      authors = [
        {
          signature = "Carson Henrich";
          username = "ghenricc";
        }
      ];
    };
  };

  # Base Config: https://github.com/ghenricc/dev-configs/blob/main/nix/src/cfg/conform.nix 
  # Config Reference: https://github.com/siderolabs/conform?tab=readme-ov-file
  conform = mkNixago cfg.conform {
    data.commit.conventional.scopes = dmerge.append (
      l.attrNames templates
    );
  };

  # Base Config: https://github.com/ghenricc/dev-configs/blob/main/nix/src/cfg/editorconfig.nix 
  # Config Reference: https://spec.editorconfig.org/
  editorconfig = mkNixago cfg.editorconfig;

  # Base Config: https://github.com/ghenricc/dev-configs/blob/main/nix/src/cfg/githubsettings.nix 
  # Config Reference: https://github.com/github/safe-settings/blob/main-enterprise/docs/sample-settings/settings.yml
  githubsettings = mkNixago cfg.githubsettings {
    data.repository = {
      name = repository;
      inherit (import (inputs.self + /flake.nix)) description;
      homepage = "";
      topics = "nix nix-flakes devshells";
      private = false;
    };
  };

  # Base Config: https://github.com/ghenricc/dev-configs/blob/main/nix/src/cfg/lefthook.nix 
  # Config Reference: https://evilmartians.github.io/lefthook/configuration/index.html
  lefthook = mkNixago cfg.lefthook;

  # Base Config: https://github.com/ghenricc/dev-configs/blob/main/nix/src/cfg/treefmt.nix 
  # Config Reference: https://treefmt.com/latest/getting-started/configure/#ci 
  treefmt = mkNixago cfg.treefmt {
    data.excludes = dmerge.append [
      "nix/src/templates/**"
    ];
  };

  # Base Config: https://github.com/ghenricc/dev-configs/blob/main/nix/src/cfg/typos.nix 
  # Config Reference: https://github.com/crate-ci/typos/blob/master/docs/reference.md
  typos = mkNixago cfg.typos;
}
