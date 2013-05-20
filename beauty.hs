#!/usr/bin/env runhaskell

import Data.Bits (popCount)
import Control.Monad (replicateM_)

data Player
     = FirstPlayer
     | SecondPlayer

instance Show Player where
  show FirstPlayer = "First Player"
  show SecondPlayer = "Second Player"

switchTurn :: Player -> Player
switchTurn FirstPlayer = SecondPlayer
switchTurn SecondPlayer = FirstPlayer

lg = floor . logBase 2 . fromIntegral

-- Number of 1's in binary representation
beauty = popCount

asBeautifulAs :: Int -> [Int]
asBeautifulAs n = [ k | k <- [0 .. lg n], beauty (n - (2^k)) == beauty n ]

-- Determines which player would win a game,
-- Given n and a starting player
whoWouldWin :: Player -> Int -> Player
whoWouldWin p n
  | n < 1 = p
  | n == 1 = switchTurn p
  | length ks >= 1 = whoWouldWin (switchTurn p) n'
  | otherwise = switchTurn p
  where
    ks = asBeautifulAs n
    n' = n - (2^(head ks))

main :: IO ()
main = do
  testCases' <- getLine
  let testCases = read testCases' :: Int

  replicateM_ testCases $ do
    n' <- getLine
    let n = read n' :: Int
    (print . whoWouldWin FirstPlayer) n
