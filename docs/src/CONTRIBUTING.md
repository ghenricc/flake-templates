<!--
SPDX-FileCopyrightText: 2025 Carson Henrich <carson03henrich@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
-->

[nix]: https://nixos.org/download.html
[direnv]: https://direnv.net/

# Contributing

This Repository uses [Nix](nix) and [`direnv`](direnv), and both must be
installed to use the development enviromment. This ensures contributors have a
consistent development experience and allows me to add tooling to the
repository. This is because it defines several git-hooks that verify certain
practices are met.

**The development environment must be used to contribute to this repository**

**The git-hooks must be comprehensive in verification of code-correctness**

### Enter Development Environment

```console
direnv allow
```

### Change Development Environment

```console
$EDITOR ./nix/dev/configs.nix
direnv reload
```

### Preview Documentation

**You need to be inside the Development Environment.**

```console
mdbook build -o
```
