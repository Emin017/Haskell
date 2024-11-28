module Main where

main :: IO ()
main = do
  sayHelloTreeTimes "World"
  print (calcDensities [(1, 2), (3, 4)])

sayHello :: String -> IO ()
sayHello name = putStrLn ("Hello, " ++ name ++ "!")

sayHelloTreeTimes :: String -> IO ()
sayHelloTreeTimes name = sequence_ (take 3 (repeat (sayHello name)))

calcDensities :: (RealFloat a) => [(a, a)] -> [a]
calcDensities xs = [density m v | (m, v) <- xs]
  where
    density mass volume = mass / volume
