# db-up

> Create quick postgres service via Docker Compose

In the directory you want to create compose.yaml file

```shell
$ db-up
```

### Installation via Nixpkgs

```nix
db-up-derivation = ({ pkgs, package, rev, ghc }:
  pkgs.stdenv.mkDerivation {
    name = "${package}";
    src = builtins.fetchGit {
      url = "git@github.com:rajatsharma/db-up";
      ref = "master";
      rev = rev;
    };
    buildPhase = ''
      ${ghc}/bin/ghc Main.hs
    '';
    installPhase = ''
      mkdir -p $out/bin
      cp -r ./Main $out/bin/db-up
    '';
  });
```

Call the function

```nix
db-up = db-up-derivation {
  pkgs = pkgs;
  ghc = ghc;
  package = "db-up";
  rev = "2dfa8c678b060ee686bbb522ca8bc8362b050b49";
};
```
