{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.flake-compat = {
    url = "github:edolstra/flake-compat";
    flake = false;
  };
  outputs = { self, nixpkgs, flake-utils, flake-compat, ... }:
    let
      overlay = (final: prev: {
        haskell-hello = final.haskellPackages.callCabal2nix "haskell-hello" ./. { };
      });
    in
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ overlay ];
            config = { allowBroken = true; };
          };
        in
        with pkgs; {
          packages = {
            haskell-hello = pkgs.haskell-hello;
          };
          formatter = pkgs.nixpkgs-fmt;
          devShells.default = mkShell {
            buildInputs = with haskellPackages; [
              ghc
              cabal-install
            ];
          };
          # hydraJobs = { inherit packages; };
        }) // { };
}
