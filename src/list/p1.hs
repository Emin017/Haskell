module Main where

main :: IO ()
main = do
  print "Output the last element of a list"
  print (myLast [1, 2, 3, 4, 5])
  print "Output the last but one element of a list"
  print (myLast ['x', 'y', 'z'])

-- Find the last element of a list.
myLast :: [a] -> a
myLast [] = error "Empty list"
myLast [x] = x
-- Recursive call to myLast function to get the last element of the list
myLast (_ : xs) = myLast xs
