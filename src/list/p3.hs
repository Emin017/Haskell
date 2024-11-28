module Main where

main :: IO ()
main = do
  print "Output the k'th element of a list"
  print (elementAt [1, 2, 3] 2)
  print "Output the k'th element of a list"
  print (elementAt "haskell" 5)

-- Find the K'th element of a list.
elementAt :: [a] -> Int -> a
elementAt [] _ = error "Empty list"
elementAt (x : _) 1 = x
elementAt (_ : xs) k
  | k < 1 = error "Index out of bounds"
  | otherwise = elementAt xs (k - 1)
