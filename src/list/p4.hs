module Main where

main :: IO ()
main = do
  print "Output the number of elements in a list"
  print $ myLength [123, 456, 789]
  print "Output the number of elements in a list"
  print $ myLength "Hello, world!"

-- Find the number of elements in a list.
myLength :: [a] -> Int
myLength [] = 0
myLength (_ : xs) = 1 + myLength xs
