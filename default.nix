{
  bun2nix,
  runCommand,
  stdenv,
  lib,
  ...
}:
let
  # Generated at build time from bun.lock so we don't keep a second file in
  # sync. bun2nix is a pure transformation here - bun.lock already contains
  # integrity hashes for every dependency, so no network access is needed.
  # This uses import-from-derivation: evaluation pauses until bun.nix is built.
  bunNix = runCommand "bun.nix" {
    nativeBuildInputs = [ bun2nix ];
  } ''
    bun2nix -l ${./bun.lock} -o $out
  '';
in
# The site is fully prerendered (adapter-static), so the package is just the
# built files - no runtime server. bun2nix.hook installs node_modules from
# the prefetched cache before buildPhase runs.
stdenv.mkDerivation {
  pname = "south-website";
  version = "1.0";

  src = ./.;

  nativeBuildInputs = [ bun2nix.hook ];

  bunDeps = bun2nix.fetchBunDeps {
    inherit bunNix;
  };

  # `sharp` (pulled in by @sveltejs/enhanced-img to optimize images at build
  # time) ships a prebuilt native module that dlopen()s libstdc++.so.6, which
  # isn't on the default library path under Nix. Expose it so `bun run build`
  # can load sharp. Build-time only - the output is static files.
  LD_LIBRARY_PATH = lib.makeLibraryPath [ stdenv.cc.cc.lib ];

  buildPhase = ''
    runHook preBuild

    bun run build

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    cp -r build $out

    runHook postInstall
  '';
}
