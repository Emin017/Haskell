module Main where

main :: IO ()
main = do
  let n = 4
  let inf = 999999
  let graph = [[0, 2, 6, 4], [inf, 0, 3, inf], [7, inf, 0, 1], [5, inf, 12, 0]]
  let dist = myFloyd graph
  printMatrix dist

-- | Computes the shortest paths between all pairs of nodes in a graph using the Floyd-Warshall algorithm.
--
--   Given a graph represented as an adjacency matrix, where the element at row i and column j represents
--   the weight of the edge from node i to node j (use a high value like infinity for no direct connection),
--   this function calculates the shortest path distances between every pair of nodes.
--
--   The output is an adjacency matrix where each element at row i and column j is the shortest distance
--   from node i to node j.
--
--   __Parameters:__
--
--   * @graph :: [[Int]]@ - The adjacency matrix representation of the graph.
--
--   __Returns:__
--
--   * @[[Int]]@ - The matrix of shortest path distances between all pairs of nodes.
--
--   __Example Usage:__
--
--   @
--   let infinity = maxBound :: Int
--   let graph = [ [0,       3,       infinity, 5],
--                 [2,       0,       infinity, 4],
--                 [infinity, 1,       0,       infinity],
--                 [infinity, infinity, 2,       0] ]
--   let shortestPaths = myFloyd graph
--   @
--
--   After running @myFloyd graph@, @shortestPaths@ will contain the shortest distances between all pairs of nodes.
myFloyd :: [[Int]] -> [[Int]]
myFloyd graph = foldl step graph [0 .. n - 1]
  where
    n = length graph
    step dist k = [[update i j k dist | j <- [0 .. n - 1]] | i <- [0 .. n - 1]]
    update i j k dist =
      min
        (dist !! i !! j)
        (dist !! i !! k + dist !! k !! j)

-- | Prints a matrix of integers to the console, with each row on a new line and elements separated by spaces.
printMatrix :: [[Int]] -> IO ()
printMatrix dist = mapM_ (putStrLn . unwords . map show) dist
