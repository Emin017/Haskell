module Main where

main :: IO ()
main = print $ prim graph 1

type Node = Int

type Cost = Int

type Graph = [(Node, [(Node, Cost)])]

prim :: Graph -> Node -> [(Node, Node, Cost)]
prim graph start = go [] [start]
  where
    go mst visited
      | length visited == length graph = mst
      | otherwise = go mst' visited'
      where
        (u, v, cost) = minimum [(u, v, cost) | u <- visited, (v, cost) <- neighbors u, v `notElem` visited]
        visited' = v : visited
        mst' = (u, v, cost) : mst
        neighbors u = fromJust $ lookup u graph
        fromJust (Just x) = x

{- Graph visualization:

    1 ----7---- 2
    | \         | \
    |  \        |  15
    9   14     10  |
    |     \     |   4
    |      \    |  /
    3 ---2----  6  |
    |            \ |
    11            \|
    |              5
    4 ----6-------/

Vertices: 1,2,3,4,5,6
Edge weights shown on lines
-}
graph :: Graph
graph =
  [ (1, [(2, 7), (3, 9), (6, 14)]),
    (2, [(1, 7), (3, 10), (4, 15)]),
    (3, [(1, 9), (2, 10), (4, 11), (6, 2)]),
    (4, [(2, 15), (3, 11), (5, 6)]),
    (5, [(4, 6), (6, 9)]),
    (6, [(1, 14), (3, 2), (5, 9)])
  ]
