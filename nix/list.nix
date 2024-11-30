{ pkgs, mkDerivation, Cabal, base, lib }:
let
  sourcePath = lib.attrNames (builtins.readDir ./../src/list);
  sourceFiles = map (name: ./../src/list/${name}) sourcePath;
  sourceFilesWithCabal = sourceFiles ++ [ ./../Algorithms-hs.cabal ];
in
mkDerivation
{
  pname = "list";
  version = "0.1.0.0";
  src = with lib.fileset; toSource {
    root = ./..;
    fileset = unions sourceFilesWithCabal;
  };
  setupHaskellDepends =
    [ base Cabal ];
  libraryHaskellDepends = [ base ];
  license = "unknown";
}
