module Main where

main :: IO ()
main = do
  print "Sort a list of lists by quicksort"
  print "Original list: [3,2,1,5,4,7,9,8,6]"
  print "Expected output: [1,2,3,4,5,6,7,8,9]"
  print "Output:"
  print $ myQuicksort [3, 2, 1, 5, 4, 7, 9, 8, 6]
  print "Original list: [9,8,7,6,5,4,3,2,1]"
  print "Expected output: [1,2,3,4,5,6,7,8,9]"
  print "Output:"
  print $ myQuicksort [9, 8, 7, 6, 5, 4, 3, 2, 1]

myQuicksort :: (Ord a) => [a] -> [a]
myQuicksort [] = []
myQuicksort (x : xs) = myQuicksort [a | a <- xs, a <= x] ++ [x] ++ myQuicksort [a | a <- xs, a > x]
