# OCI image serving a static site with caddy.
{
  lib,
  dockerTools,
  writeText,
  caddy,
  # The static site derivation to serve
  site,
  name ? "south-website",
  tag ? "latest",
  port ? "3000",
  ...
}:
let
  caddyConfig = writeText "caddy.json" (builtins.toJSON {
    # No runtime reconfiguration in an immutable container, disable admin api
    admin.disabled = true;

    apps.http.servers.static = {
      listen = [ ":${port}" ];
      automatic_https.disable = true;

      # Routes chain in order; the header route isn't terminal, so
      # matching requests fall through to file_server below.
      routes = [
        {
          # SvelteKit emits content-hashed assets under /_app/immutable.
          # Since paths are hashed they are safe to be cashed by the browser indefinitely.
          match = [{
            path = [ "/_app/immutable/*" ];
          }];
          handle = [
            # Set cache control header to cache this for a year and never revalidate
            {
              handler = "headers";
              response.set."Cache-Control" =
                [ "public, max-age=31536000, immutable" ];
            }
          ];
        }
        {
          match = [{
            # try to match .html file at requested path
            file = {
              root = "${site}";
              try_files = [ "{http.request.uri.path}.html" ];
            };
          }];
          handle = [{
            # reroute to found file
            handler = "rewrite";
            uri = "{http.matchers.file.relative}";
          }];
        }
        {
          handle = [
            # Encoding handler: prefer zstd, fall back to gzip
            {
              handler = "encode";
              encodings = { zstd = { }; gzip = { }; };
              prefer = [ "zstd" "gzip" ];
            }
            # File server handler: serve the static html
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
    Entrypoint = [
      (lib.getExe caddy)
      "run"
      "--config" "${caddyConfig}"
    ];
    # Point caddy's storage at /tmp
    Env = [ "HOME=/tmp" ];
    ExposedPorts = { "${port}/tcp" = { }; };
  };

  # create tmp folder
  extraCommands = "mkdir -m 1777 -p tmp";
}
