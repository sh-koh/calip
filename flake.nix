{
  description = "A development environment for this go project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, nixpkgs, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" ];
      perSystem = { config, lib, pkgs, ... }: {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [ go air delve ];
        };
        packages.default = pkgs.buildGoModule {
          name = "calip";
          src = ./.;
          version = "0.0.1";
          vendorHash = null;
        };
      };
    };
}
