{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.flake-compat = {
    url = "github:edolstra/flake-compat";
    flake = false;
  };
  inputs.pre-commit-hooks.url = "github:cachix/git-hooks.nix";
  inputs.treefmt-nix.url = "github:numtide/treefmt-nix";
  outputs = { self, nixpkgs, flake-utils, flake-compat, pre-commit-hooks, treefmt-nix, ... }:
    let
      overlay = (final: prev: {
        # algorithms-hs = final.haskellPackages.callCabal2nix "Algorithms-hs" ./. { };
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
          treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
        in
        with pkgs; {
          formatter = treefmtEval.config.build.wrapper;
          checks = {
            pre-commit-check = pre-commit-hooks.lib.${system}.run {
              src = ./.;
              hooks = {
                nixpkgs-fmt.enable = true;
                ormolu.enable = true;
                markdownlint.enable = true;
              };
            };
            formatting = treefmtEval.config.build.check self;
          };
          devShells.default = mkShell {
            buildInputs = with haskellPackages; [
              ghc
              cabal-install
            ] ++ self.checks.${system}.pre-commit-check.enabledPackages;
            inherit (self.checks.${system}.pre-commit-check) shellHook;
          };
          # hydraJobs = { inherit packages; };
        }) // { };
}
