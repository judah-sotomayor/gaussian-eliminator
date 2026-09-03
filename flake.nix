{
  description = "gaussian eliminator software";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    cl-nix-lite.url = "github:judah-sotomayor/cl-nix-lite/v0";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    git-hooks.url = "github:cachix/git-hooks.nix";
    in-nomine = {
      url = "github:judah-sotomayor/in-nomine";
      flake = false;
    };
  };

  outputs =
    inputs@{ flake-parts, cl-nix-lite, ... }:

    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      imports = [
        inputs.treefmt-nix.flakeModule
        inputs.git-hooks.flakeModule
      ];
      perSystem =
        {
          config,
          self',
          inputs',
          pkgs,
          system,
          ...
        }:
        {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [ cl-nix-lite.overlays.default ];
          };

          treefmt = {
            programs.nixfmt.enable = true;
            programs.nixfmt.strict = true;
          };

          packages =
            let
              gaussian-eliminator =
                with pkgs.lispPackagesLite;
                lispDerivation {
                  src = pkgs.lib.cleanSource ./.;
                  lispSystems = [ "gaussian-eliminator" ];
                  lispDependencies = [ serapeum ];
                  lispCheckDependencies = [ fiasco ];
                };
            in
            {
              default = gaussian-eliminator;
              inherit gaussian-eliminator;
            };

          devShells.default = pkgs.mkShell {
            shellHook = ''
              ${config.pre-commit.shellHook}
            '';
            packages = config.pre-commit.settings.enabledPackages;
          };
        };
    };
}
