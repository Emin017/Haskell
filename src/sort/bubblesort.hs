module Main where

main :: IO ()
main = do
  print "Sort a list of lists by bubblesort"
  print $ "Original list:" ++ show listToSort
  print "Expected output: [1,2,3,4,5,6,7,8,9]"
  print $ "Output:" ++ show (myBubbleSort listToSort)

listToSort :: [Int]
listToSort = [3, 2, 1, 5, 4, 7, 9, 8, 6]

myBubbleSort :: (Ord a) => [a] -> [a]
myBubbleSort lst =
  if bpassed == lst
    then lst
    else myBubbleSort bpassed
  where
    bpassed = bubblePass lst

-- A single pass of bubble sort
bubblePass :: (Ord a) => [a] -> [a]
bubblePass [] = [] -- Empty list is empty.
bubblePass [x] = [x] -- Singleton list is always trivially sorted.
bubblePass (x1 : x2 : xs) =
  if x1 > x2
    then x2 : bubblePass (x1 : xs)
    else x1 : bubblePass (x2 : xs)
