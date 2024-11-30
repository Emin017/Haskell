{ pkgs ? import <nixpkgs> { } }:
{
  list = pkgs.haskellPackages.callPackage ./nix/list.nix { };
}
