<!--
SPDX-FileCopyrightText: 2025 Carson Henrich <carson03henrich@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
-->

<!-- TODO(base-flake-template): Edit README.md -->
<!-- TODO(base-flake-template): # Title -->
<!-- TODO(base-flake-template): ## About -->
<!-- TODO(base-flake-template): ## Usage -->
<!-- TODO(base-flake-template): ## [Contributing](./docs/CONTRIBUTING.md) -->
<!-- TODO(base-flake-template): ## [Design & Architecture](./docs/ARCHITECTURE.md) -->
<!-- TODO(base-flake-template): ## [Roadmap](./docs/ROADMAP.md) -->

<!-- TODO(base-flake-template): Remove this Section -->

# Using this template

## Initialize new Project

```console
# make a new empty project dir
mkdir project && cd project

# grab the template
nix flake init -t github:CarsonHenrich/flake-templates#base

# Initialize git repo
git init && git add . && git commit -m "WIP! feat: initial commit"
```

## See where to change things

```console
grep -r 'TODO(base-flake-template)' .
```

## Enter the devShell

```console
direnv allow
```
