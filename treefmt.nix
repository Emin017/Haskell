# treefmt.nix
{ pkgs, ... }:
{
  # Used to find the project root
  projectRootFile = "flake.nix";
  # Enable the ormolu formatter
  programs.ormolu.enable = true;
  programs.nixpkgs-fmt.enable = true;
  programs.cabal-fmt.enable = true;
  programs.yamlfmt.enable = true;
}
