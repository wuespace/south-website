{
  description = "Bun2nix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    bun2nix.url = "github:nix-community/bun2nix?ref=2.1.0";
  };

  outputs = { self, nixpkgs, flake-utils, bun2nix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        lib = pkgs.lib;

        package = pkgs.callPackage ./default.nix {
          bun2nix = bun2nix.packages.${system}.default;
        };
      in
      {
        devShells.default =
        pkgs.mkShell {
          buildInputs = with pkgs; [
            bun
            svelte-check
            typescript-language-server
            svelte-language-server
          ];

          # sharp (via @sveltejs/enhanced-img) loads a prebuilt native module
          # that needs libstdc++.so.6 on the library path; without this
          # `bun run dev/build/check` fails to load sharp on NixOS.
          LD_LIBRARY_PATH = lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ];
        };

        packages.default = package;

        # OCI image serving the static site with caddy.
        packages.container = pkgs.callPackage ./container.nix {
          site = package;
        };
      }
    );
}
