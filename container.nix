# OCI image serving the static site with caddy.
{
  lib,
  dockerTools,
  writeText,
  caddy,
  # The static site derivation to serve (not resolvable from pkgs, so it must
  # be passed explicitly by the caller).
  site,
  name ? "south-website",
  tag ? "latest",
  port ? "3000",
  ...
}:
let
  # Caddy's native config format is JSON (the Caddyfile is just an
  # adapter for it), so the config can live in Nix directly.
  caddyConfig = writeText "caddy.json" (builtins.toJSON {
    # No runtime reconfiguration in an immutable container, so
    # don't bind the admin API (this also disables config persistence).
    admin.disabled = true;

    apps.http.servers.static = {
      listen = [ ":${port}" ];
      automatic_https.disable = true;

      # Routes chain in order; the header route isn't terminal, so
      # matching requests fall through to file_server below.
      routes = [
        {
          # SvelteKit emits content-hashed assets under /_app/immutable.
          match = [ { path = [ "/_app/immutable/*" ]; } ];
          handle = [
            {
              handler = "headers";
              response.set."Cache-Control" =
                [ "public, max-age=31536000, immutable" ];
            }
          ];
        }
        {
          handle = [
            {
              handler = "encode";
              encodings = { zstd = { }; gzip = { }; };
              prefer = [ "zstd" "gzip" ];
            }
            {
              handler = "file_server";
              root = "${site}";
            }
          ];
        }
      ];
    };
  });
in
dockerTools.buildLayeredImage {
  inherit name;
  inherit tag;

  # Defaults to "scratch" image
  fromImage = null;

  config = {
    # caddy is fine as PID 1: it handles SIGTERM and spawns no children.
    # JSON is the default adapter, so no --adapter flag needed.
    Entrypoint = [
      (lib.getExe caddy)
      "run"
      "--config" "${caddyConfig}"
    ];
    # Point caddy's storage at /tmp
    Env = [ "HOME=/tmp" "XDG_CONFIG_HOME=/tmp" "XDG_DATA_HOME=/tmp" ];
    ExposedPorts = { "${port}/tcp" = { }; };
  };

  extraCommands = "mkdir -m 1777 -p tmp";
}
