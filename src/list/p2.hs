module Main where

main :: IO ()
main = do
  print "Output the last-but-one element of a list"
  print (myButLast [1, 2, 3, 4, 5])
  print "Output the last-but-one element of a list"
  print (myButLast ['a' .. 'z'])

-- Find the last-but-one (or second-last) element of a list.
myButLast :: [a] -> a
myButLast [] = error "Empty list"
myButLast [x] = error "List has only one element"
myButLast [x, _] = x
myButLast (_ : xs) = myButLast xs
