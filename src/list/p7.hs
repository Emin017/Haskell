module Main where

data NestedList a = Elem a | List [NestedList a]

main :: IO ()
main = do
  print "Flatten a nested list structure."
  print $ myFlatten (Elem 5)
  print $ myFlatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]])
  print (myFlatten (List []) :: [Int])
  print "Flatten a nested list structure."
  print $ flatten3 (Elem 5)
  print $ flatten3 (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]])
  print (flatten3 (List []) :: [Int])

myFlatten :: NestedList a -> [a]
myFlatten (Elem x) = [x]
myFlatten (List x) = concatMap myFlatten x

flatten3 :: NestedList a -> [a]
flatten3 (Elem x) = [x]
flatten3 (List xs) = foldr (++) [] $ map flatten3 xs
