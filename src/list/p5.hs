module Main where

main :: IO ()
main = do
  print "Reverse a list"
  print $ myReverse [1, 2, 3, 4, 5]
  print "Reverse a list"
  print $ myReverse "A man, a plan, a canal, panama!"

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x : xs) = myReverse xs ++ [x]
