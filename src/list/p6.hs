module Main where

main :: IO ()
main = do
  print "Find out whether a list is a palindrome"
  print (isPalindrome [1, 2, 3])
  print (isPalindrome "madamimadam")
  print (isPalindrome [1, 2, 4, 8, 16, 8, 4, 2, 1])

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = xs == reverse xs
