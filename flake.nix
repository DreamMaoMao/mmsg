{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      perSystem = {pkgs, ...}: let
        mmsg = pkgs.callPackage ./default.nix {};
      in {
        packages = {
          inherit mmsg;
          default = mmsg;
        };
      };
      systems = ["x86_64-linux" "aarch64-linux"];
    };
}
