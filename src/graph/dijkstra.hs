module Main where

import Data.List
import qualified Data.Map as M
import Data.Maybe
import Data.Ord
import qualified Data.Set as S

type Node = Int

type Cost = Int

type Graph = M.Map Node [(Node, Cost)]

main :: IO ()
main = print $ dijkstra graph 1

dijkstra :: Graph -> Node -> M.Map Node Cost
dijkstra graph start = go (M.singleton start 0) (S.singleton start)
  where
    go dists visited
      | S.null visited = dists
      | otherwise = go dists' visited'
      where
        nearest = fromJust $ S.lookupMin visited
        visited' = S.deleteMin visited
        dist = fromJust $ M.lookup nearest dists
        neighbors = fromJust $ M.lookup nearest graph
        dists' = foldl' relax dists neighbors
        relax dists (neighbor, cost) = M.insertWith min neighbor (dist + cost) dists

graph :: Graph
graph =
  M.fromList
    [ (1, [(2, 7), (3, 9), (6, 14)]),
      (2, [(1, 7), (3, 10), (4, 15)]),
      (3, [(1, 9), (2, 10), (4, 11), (6, 2)]),
      (4, [(2, 15), (3, 11), (5, 6)]),
      (5, [(4, 6), (6, 9)]),
      (6, [(1, 14), (3, 2), (5, 9)])
    ]
